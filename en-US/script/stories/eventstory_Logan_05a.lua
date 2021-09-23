local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Logan_05a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Logan_05a = {
	actions = {}
}
scenes.scene_eventstory_Logan_05a = scene_eventstory_Logan_05a

function scene_eventstory_Logan_05a:stage(args)
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
						name = "bg_weinasi",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_2.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_weinasi",
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
						name = "bg_jiedao",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_1.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_jiedao",
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
						name = "bg_tonghuaheishi",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_storybook_3.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_tonghuaheishi",
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
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 5,
				id = "colorBg",
				scale = 1,
				anchorPoint = {
					x = 0,
					y = 0
				},
				position = {
					refpt = {
						x = 0,
						y = 0
					}
				},
				touchEvents = {
					moved = "evt_bg_touch_moved",
					began = "evt_bg_touch_began",
					ended = "evt_bg_touch_ended"
				},
				children = {}
			},
			{
				id = "Mus_tonghuamengjing",
				fileName = "Mus_Story_Mystery_2",
				type = "Music"
			},
			{
				id = "yin_weisui",
				fileName = "Se_Story_Step",
				type = "Sound"
			},
			{
				id = "yin_qiaomen",
				fileName = "Se_Story_Knock",
				type = "Sound"
			},
			{
				id = "yin_jinru",
				fileName = "Se_Story_Vortex",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 999,
				visible = false,
				id = "xiao_jinru",
				scale = 0.5,
				actionName = "mengjinga_juqingtexiao",
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

function scene_eventstory_Logan_05a.actions.start_eventstory_Logan_05a(_root, args)
	return sequential({
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "legend_bg01.jpg",
					printAudioOff = true,
					bgShow = true,
					center = 1,
					content = {
						"eventstory_Logan_05a_1",
						"eventstory_Logan_05a_2",
						"eventstory_Logan_05a_3",
						"eventstory_Logan_05a_4",
						"eventstory_Logan_05a_5"
					},
					durations = {
						0.08,
						0.08,
						0.08,
						0.08,
						0.08
					},
					waitTimes = {
						1,
						1,
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
			action = "activateNode",
			actor = __getnode__(_root, "bg_weinasi")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_tonghuamengjing"),
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
						brightness = -255,
						modelId = "Model_XHMao_single",
						id = "lbiheibian",
						rotationX = 0,
						scale = 0.72,
						zorder = 300,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
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
						brightness = 255,
						modelId = "Model_XHMao_single",
						id = "lbibaibian",
						rotationX = 0,
						scale = 0.716,
						zorder = 305,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
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
						modelId = "Model_XHMao_single",
						id = "lbi",
						rotationX = 0,
						scale = 0.71,
						zorder = 310,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "lbi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "lbi/face_lbi_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "lbi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 76,
									y = 1006.9
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbi"),
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
						brightness = -255,
						modelId = "Model_ALSi",
						id = "ALSiheibian",
						rotationX = 0,
						scale = 0.58,
						zorder = 403,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.51,
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
						brightness = 255,
						modelId = "Model_ALSi",
						id = "ALSibaibian",
						rotationX = 0,
						scale = 0.576,
						zorder = 406,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.51,
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
						modelId = "Model_ALSi",
						id = "ALSi",
						rotationX = 0,
						scale = 0.57,
						zorder = 409,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ALSi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ALSi/ALSi_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ALSi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 19.5,
									y = 806.9
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ALSiheibian"),
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
				actor = __getnode__(_root, "ALSibaibian"),
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
				actor = __getnode__(_root, "ALSi"),
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
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSi"),
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
						brightness = -255,
						modelId = "Model_ATSheng",
						id = "ATShengheibian",
						rotationX = 0,
						scale = 0.61,
						zorder = 203,
						position = {
							x = 0,
							y = -230,
							refpt = {
								x = -0.45,
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
						brightness = 255,
						modelId = "Model_ATSheng",
						id = "ATShengbaibian",
						rotationX = 0,
						scale = 0.606,
						zorder = 206,
						position = {
							x = 0,
							y = -230,
							refpt = {
								x = -0.45,
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
						modelId = "Model_ATSheng",
						id = "ATSheng",
						rotationX = 0,
						scale = 0.6,
						zorder = 209,
						position = {
							x = 0,
							y = -230,
							refpt = {
								x = -0.45,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ATSheng_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ATSheng/ATSheng_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ATSheng_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -38.5,
									y = 958
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ATShengheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ATShengbaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ATSheng"),
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
						brightness = -255,
						modelId = "Model_PNCao",
						id = "PNCaoheibian",
						rotationX = 0,
						scale = 0.71,
						zorder = 303,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.75,
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
						brightness = 255,
						modelId = "Model_PNCao",
						id = "PNCaobaibian",
						rotationX = 0,
						scale = 0.706,
						zorder = 306,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.75,
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
						modelId = "Model_PNCao",
						id = "PNCao",
						rotationX = 0,
						scale = 0.7,
						zorder = 309,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.75,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "PNCao_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "PNCao/PNCao_face_1.png",
								scaleX = 0.98,
								scaleY = 0.98,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "PNCao_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -11.5,
									y = 1097
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCao"),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0
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
			action = "play",
			actor = __getnode__(_root, "yin_qiaomen"),
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
			action = "stop",
			actor = __getnode__(_root, "yin_qiaomen")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.45,
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_05a_6"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_05a_7"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ATShengheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ATShengbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ATSheng"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCao"),
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
				action = "moveTo",
				actor = __getnode__(_root, "ATShengheibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -230,
							refpt = {
								x = 0.28,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ATShengbaibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -230,
							refpt = {
								x = 0.28,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ATSheng"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -230,
							refpt = {
								x = 0.28,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ATSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ATSheng/ATSheng_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_3",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ATSheng"
						},
						content = {
							"eventstory_Logan_05a_8"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALSi/ALSi_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PNCao_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PNCao/PNCao_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_14",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALSi",
							"PNCao"
						},
						content = {
							"eventstory_Logan_05a_9"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.75,
								y = 0
							}
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
						brightness = -255,
						modelId = "Model_YXiu",
						id = "qjwanheibian",
						rotationX = 0,
						scale = 0.79,
						zorder = 100,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.15,
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
						brightness = 255,
						modelId = "Model_YXiu",
						id = "qjwanbaibian",
						rotationX = 0,
						scale = 0.786,
						zorder = 105,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.15,
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
						modelId = "Model_YXiu",
						id = "qjwan",
						rotationX = 0,
						scale = 0.78,
						zorder = 110,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.15,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "qjwan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "qjwan/face_qjwan_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "qjwan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -62.5,
									y = 959
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "qjwanheibian"),
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
				actor = __getnode__(_root, "qjwanbaibian"),
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
				actor = __getnode__(_root, "qjwan"),
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
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "qjwan"),
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ATShengheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ATShengbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ATSheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0
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
					name = "Logan_dialog_speak_name_4",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"qjwan"
					},
					content = {
						"eventstory_Logan_05a_10"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_05a_11"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "qjwan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "qjwan/face_qjwan_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_4",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"qjwan"
						},
						content = {
							"eventstory_Logan_05a_12"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lbi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lbi/face_lbi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_13"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "qjwan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "qjwan/face_qjwan_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_4",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"qjwan"
						},
						content = {
							"eventstory_Logan_05a_14"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
					name = "Logan_dialog_speak_name_4",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"qjwan"
					},
					content = {
						"eventstory_Logan_05a_15"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lbi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lbi/face_lbi_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_16"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
					name = "Logan_dialog_speak_name_4",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"qjwan"
					},
					content = {
						"eventstory_Logan_05a_17"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lbi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lbi/face_lbi_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_18"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lbiheibian"),
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
				actor = __getnode__(_root, "lbibaibian"),
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
				actor = __getnode__(_root, "lbi"),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.55,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "qjwan"),
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
						brightness = -255,
						modelId = "Model_TLSi",
						id = "ldaheibian",
						rotationX = 0,
						scale = 0.81,
						zorder = 400,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.4,
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
						brightness = 255,
						modelId = "Model_TLSi",
						id = "ldabaibian",
						rotationX = 0,
						scale = 0.806,
						zorder = 405,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.4,
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
						modelId = "Model_TLSi",
						id = "lda",
						rotationX = 0,
						scale = 0.8,
						zorder = 410,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.4,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "lda_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "lda/face_lda_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "lda_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -113.4,
									y = 1048
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lda"),
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
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jiedao"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_weinasi"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "lbi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lbi/face_lbi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_19"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.45,
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
				action = "play",
				actor = __getnode__(_root, "yin_weisui")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -375,
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
					duration = 0.45
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_weisui")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lda"
					},
					content = {
						"eventstory_Logan_05a_20"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "lbi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lbi/face_lbi_5.png",
					pathType = "STORY_FACE"
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "lda_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lda/face_lda_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuaheishi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_jiedao"),
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
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_weisui")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -375,
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
					duration = 0.45
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_weisui")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lda"
					},
					content = {
						"eventstory_Logan_05a_21"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "lda_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lda/face_lda_4.png",
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
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.35,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.85,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.35,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.85,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.35,
						position = {
							x = 0,
							y = -300,
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
					duration = 0.35
				}
			end
		}),
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.85,
									y = 0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.85,
									y = 0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.85,
									y = 0.05
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.85,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.85,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.85,
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
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_22"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
				action = "orbitCamera",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lbi"),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.25,
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
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.25,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.25,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.25,
									y = -0.1
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_8",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_05a_23"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lbi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lbi/face_lbi_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_24"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
			actor = __getnode__(_root, "lbi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lbi/face_lbi_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lbiheibian"),
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
				actor = __getnode__(_root, "lbibaibian"),
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
				actor = __getnode__(_root, "lbi"),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.35,
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.35,
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
				action = "play",
				actor = __getnode__(_root, "yin_weisui")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.35,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.35,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.35,
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
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.35
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_weisui")
		}),
		concurrent({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.4,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.4,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.4,
									y = -0.1
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lda_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lda/face_lda_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_1",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lda"
						},
						content = {
							"eventstory_Logan_05a_25"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = -0.4,
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
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.3,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing7",
						id = "laobanheibian",
						rotationX = 0,
						scale = 0.91,
						zorder = 30,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.8,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = 255,
						modelId = "Model_Story_JYing7",
						id = "laobanbaibian",
						rotationX = 0,
						scale = 0.906,
						zorder = 40,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.8,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing7",
						id = "laoban",
						rotationX = 0,
						scale = 0.9,
						zorder = 45,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.8,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "laobanheibian"),
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
				actor = __getnode__(_root, "laobanbaibian"),
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
				actor = __getnode__(_root, "laoban"),
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
				actor = __getnode__(_root, "laobanheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "laobanbaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "laoban"),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laoban"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "lbi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lbi/face_lbi_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "lda_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lda/face_lda_1.png",
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_05a_26"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_13",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"laoban"
					},
					content = {
						"eventstory_Logan_05a_27"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lbi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lbi/face_lbi_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_05a_28"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
					name = "Logan_dialog_speak_name_13",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"laoban"
					},
					content = {
						"eventstory_Logan_05a_29"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.55,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "laobanheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "laobanbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "laoban"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "lbi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "lbi/face_lbi_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						zorder = 1603
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						zorder = 1606
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						zorder = 1609
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						zorder = 1703
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						zorder = 1706
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						zorder = 1709
					}
				end
			})
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_05a_30"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_05a_31"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
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
				action = "play",
				actor = __getnode__(_root, "yin_jinru"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jinru"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_jinru"),
				args = function (_ctx)
					return {
						scale = 1.2,
						duration = 0.15
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
			concurrent({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							scale = 0.61,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							scale = 0.606,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							scale = 0.6,
							duration = 0.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.54,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.54,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.54,
									y = 0.1
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "lda_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lda/face_lda_4.png",
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
			action = "stop",
			actor = __getnode__(_root, "yin_jinru")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jinru")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_jinru"),
			args = function (_ctx)
				return {
					scale = 0.5,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lda"
					},
					content = {
						"eventstory_Logan_05a_32"
					},
					durations = {
						0.03
					},
					capInsets = {
						560,
						220,
						2,
						37
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
						name = "Logan_dialog_speak_name_1",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lda"
						},
						content = {
							"eventstory_Logan_05a_33"
						},
						durations = {
							0.03
						},
						capInsets = {
							560,
							220,
							2,
							37
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
				actor = __getnode__(_root, "yin_jinru"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jinru"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_jinru"),
				args = function (_ctx)
					return {
						scale = 1.2,
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						scale = 0.71,
						duration = 0.2
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						scale = 0.706,
						duration = 0.2
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.5,
								y = 0.1
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "lda"),
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
					duration = 0.6
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jinru")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jinru")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_jinru"),
			args = function (_ctx)
				return {
					scale = 0.5,
					duration = 0
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
			actor = __getnode__(_root, "Mus_tonghuamengjing")
		})
	})
end

local function eventstory_Logan_05a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Logan_05a",
					scene = scene_eventstory_Logan_05a
				}
			end
		})
	})
end

stories.eventstory_Logan_05a = eventstory_Logan_05a

return _M
