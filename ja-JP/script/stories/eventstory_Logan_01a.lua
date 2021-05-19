local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Logan_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Logan_01a = {
	actions = {}
}
scenes.scene_eventstory_Logan_01a = scene_eventstory_Logan_01a

function scene_eventstory_Logan_01a:stage(args)
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
				children = {}
			},
			{
				resType = 0,
				name = "bg_heishi",
				pathType = "SCENE",
				type = "Image",
				image = "scene_story_storybook_3.jpg",
				layoutMode = 1,
				zorder = 15,
				id = "bg_heishi",
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
				name = "bg_tonghuamengjing",
				pathType = "SCENE",
				type = "Image",
				image = "scene_story_story_12.jpg",
				layoutMode = 1,
				zorder = 10,
				id = "bg_tonghuamengjing",
				scale = 0.75,
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
				id = "Mus_tonghuamengjing",
				fileName = "Mus_Story_Mystery_2",
				type = "Music"
			},
			{
				id = "Mus_tonghuajieju",
				fileName = "Mus_Story_Knight_Tranquility",
				type = "Music"
			},
			{
				id = "Mus_tonghuameihao",
				fileName = "Mus_Story_Mystery_2",
				type = "Music"
			},
			{
				id = "yin_gouhuo",
				fileName = "Se_Story_Fire",
				type = "Music"
			},
			{
				id = "yin_langlaile",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "yin_qiangsheng",
				fileName = "Se_Skill_Gun",
				type = "Sound"
			},
			{
				id = "yin_qiangsheng2",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				resType = 0,
				name = "bg_tonghuamengjing_qian",
				pathType = "STORY_ALPHA",
				type = "Image",
				image = "scene_story_story_11.png",
				layoutMode = 1,
				zorder = 9998,
				id = "bg_tonghuamengjing_qian",
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
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 99300,
				videoName = "story_huiyi",
				id = "xiao_huiyi",
				scale = 1.05,
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
				id = "xiao_qiang",
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Logan_01a.actions.start_eventstory_Logan_01a(_root, args)
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
			actor = __getnode__(_root, "bg_heishi")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuamengjing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_tonghuameihao"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuamengjing"),
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
					bgImage = "legend_bg01.jpg",
					printAudioOff = true,
					bgShow = true,
					center = 1,
					content = {
						"eventstory_Logan_01a_1",
						"eventstory_Logan_01a_2",
						"eventstory_Logan_01a_3",
						"eventstory_Logan_01a_4",
						"eventstory_Logan_01a_5"
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
						zorder = 200,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.2,
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
						zorder = 205,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.2,
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
						zorder = 210,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.2,
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = -255,
						modelId = "Model_ATSheng",
						id = "ATShengheibian",
						rotationX = 0,
						scale = 1.01,
						zorder = 100,
						position = {
							x = 0,
							y = -295,
							refpt = {
								x = -0.53,
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
						scale = 1.006,
						zorder = 105,
						position = {
							x = 0,
							y = -295,
							refpt = {
								x = -0.53,
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
						scale = 1,
						zorder = 110,
						position = {
							x = 0,
							y = -295,
							refpt = {
								x = -0.53,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ATSheng_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ATSheng/ATSheng_face_5.png",
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
									x = -31.2,
									y = 684
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laoban"),
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
				actor = __getnode__(_root, "qjwan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "qjwan/face_qjwan_2.png",
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
							"eventstory_Logan_01a_6"
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
						"eventstory_Logan_01a_7"
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "qjwanheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = -0.2,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "qjwanbaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = -0.2,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "qjwan"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = -0.2,
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
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "qjwanbaibian"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "qjwan"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ATShengheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -295,
								refpt = {
									x = 0.27,
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
							duration = 0.2,
							position = {
								x = 0,
								y = -295,
								refpt = {
									x = 0.27,
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
							duration = 0.2,
							position = {
								x = 0,
								y = -295,
								refpt = {
									x = 0.27,
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
						name = "Logan_dialog_speak_name_3",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ATSheng"
						},
						content = {
							"eventstory_Logan_01a_8"
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
						"eventstory_Logan_01a_9"
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
				actor = __getnode__(_root, "ATSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ATSheng/ATSheng_face_7.png",
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
							"eventstory_Logan_01a_10"
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
						"eventstory_Logan_01a_11"
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
			concurrent({
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
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "laobanheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.52,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "laobanbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.52,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "laoban"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.52,
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
						name = "Logan_dialog_speak_name_13",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"laoban"
						},
						content = {
							"eventstory_Logan_01a_12"
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
						"eventstory_Logan_01a_13"
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
			}),
			sequential({
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
					action = "moveTo",
					actor = __getnode__(_root, "qjwanheibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.79,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "qjwanbaibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.79,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "qjwan"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.79,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
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
					action = "changeTexture",
					actor = __getnode__(_root, "ATSheng_face"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "ATSheng/ATSheng_face_8.png",
							pathType = "STORY_FACE"
						}
					end
				})
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
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwan"),
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
					name = "Logan_dialog_speak_name_4",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"qjwan"
					},
					content = {
						"eventstory_Logan_01a_14"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laoban"),
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
					name = "Logan_dialog_speak_name_13",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"laoban"
					},
					content = {
						"eventstory_Logan_01a_15"
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
			}),
			sequential({
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "qjwan_face"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "qjwan/face_qjwan_2.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "ATSheng_face"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "ATSheng/ATSheng_face_4.png",
							pathType = "STORY_FACE"
						}
					end
				})
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
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwan"),
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
					name = "Logan_dialog_speak_name_3",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng"
					},
					content = {
						"eventstory_Logan_01a_16"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laobanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "laoban"),
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
					name = "Logan_dialog_speak_name_13",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"laoban"
					},
					content = {
						"eventstory_Logan_01a_17"
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "common_beijing_1.jpg",
					printAudioOff = true,
					bgShow = true,
					center = 1,
					content = {
						"eventstory_Logan_01a_18",
						"eventstory_Logan_01a_19",
						"eventstory_Logan_01a_20"
					},
					durations = {
						0.08,
						0.08,
						0.08
					},
					waitTimes = {
						1,
						1,
						1.5
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
						image = "qjwan/face_qjwan_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ATSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ATSheng/ATSheng_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		sequential({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "qjwanheibian"),
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
				actor = __getnode__(_root, "qjwanbaibian"),
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
				actor = __getnode__(_root, "qjwan"),
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
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.79,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.79,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "qjwan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.79,
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
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwanbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "qjwan"),
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
					name = "Logan_dialog_speak_name_3",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng"
					},
					content = {
						"eventstory_Logan_01a_21"
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
					name = "Logan_dialog_speak_name_4",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"qjwan"
					},
					content = {
						"eventstory_Logan_01a_22"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg_heishi"),
			args = function (_ctx)
				return {
					duration = 0.3,
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
			action = "moveTo",
			actor = __getnode__(_root, "bg_heishi"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						refpt = {
							x = 0.5,
							y = 1.5
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_heishi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "bg_tonghuamengjing"),
					args = function (_ctx)
						return {
							scale = 1.1,
							duration = 0.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "bg_tonghuamengjing"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								refpt = {
									x = 0.5,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_tonghuamengjing"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuamengjing_qian"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_tonghuamengjing"),
				args = function (_ctx)
					return {
						isLoop = true
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
								x = -0.35,
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
								x = -0.35,
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
								x = -0.35,
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
								x = 0.4,
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
								x = 0.4,
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
							"eventstory_Logan_01a_23"
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
								x = 1.4,
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
								x = 1.4,
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
								x = 1.4,
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = -255,
						modelId = "Model_Enemy_MYKSi",
						id = "guai_1heidi",
						rotationX = 0,
						scale = 0.61,
						zorder = 40,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.2,
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
						modelId = "Model_Enemy_MYKSi",
						id = "guai_1baidi",
						rotationX = 0,
						scale = 0.606,
						zorder = 45,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.2,
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
						modelId = "Model_Enemy_MYKSi",
						id = "guai_1",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.2,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_1heidi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_1baidi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_1"),
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
						brightness = -255,
						modelId = "Model_Enemy_MYKSi",
						id = "guai_2heidi",
						rotationX = 0,
						scale = 0.61,
						zorder = 40,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0.1
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
						modelId = "Model_Enemy_MYKSi",
						id = "guai_2baidi",
						rotationX = 0,
						scale = 0.606,
						zorder = 45,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0.1
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
						modelId = "Model_Enemy_MYKSi",
						id = "guai_2",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0.1
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_2heidi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_2baidi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_2"),
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
						brightness = -255,
						modelId = "Model_Enemy_MYKSi",
						id = "guai_3heidi",
						rotationX = 0,
						scale = 0.61,
						zorder = 40,
						position = {
							x = 0,
							y = 0,
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
						modelId = "Model_Enemy_MYKSi",
						id = "guai_3baidi",
						rotationX = 0,
						scale = 0.606,
						zorder = 45,
						position = {
							x = 0,
							y = 0,
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
						modelId = "Model_Enemy_MYKSi",
						id = "guai_3",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = 0,
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
				action = "updateNode",
				actor = __getnode__(_root, "guai_3heidi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_3baidi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "guai_3"),
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
				actor = __getnode__(_root, "guai_1heidi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_1baidi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_2heidi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_2baidi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_3heidi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_3baidi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "guai_3"),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.4,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_qiang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.18,
							y = 0.6
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_qiangsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_qiang"),
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_qiangsheng")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_qiang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_qiang")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_qiang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.48,
							y = 0.7
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_qiangsheng2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_qiang"),
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_qiangsheng2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_qiang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_qiang")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_qiang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.78,
							y = 0.6
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_qiangsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_qiang"),
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_qiangsheng")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_qiang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_qiang")
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_3"),
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "guai_1heidi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
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
				actor = __getnode__(_root, "guai_1baidi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
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
				actor = __getnode__(_root, "guai_2heidi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "guai_2baidi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "guai_3heidi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.8,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "guai_3baidi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.8,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_1heidi"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_1baidi"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_2heidi"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_2baidi"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_3heidi"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "guai_3baidi"),
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
								x = 0.54,
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
								x = 0.54,
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
								x = 0.54,
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
						"eventstory_Logan_01a_24"
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
					duration = 0.4
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
								x = 0.54,
								y = -0.15
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
								x = 0.54,
								y = -0.15
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
								x = 0.54,
								y = -0.15
							}
						}
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_gouhuo"),
			args = function (_ctx)
				return {
					time = -1
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
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
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
						"eventstory_Logan_01a_25"
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
							"eventstory_Logan_01a_26"
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
							"eventstory_Logan_01a_27"
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
			action = "play",
			actor = __getnode__(_root, "yin_langlaile"),
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
									x = 0.54,
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
									x = 0.54,
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
									x = 0.54,
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
								x = 0.46,
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
								x = 0.46,
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
								x = 0.46,
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
								x = 0.54,
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
								x = 0.54,
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
								x = 0.54,
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
			action = "stop",
			actor = __getnode__(_root, "yin_langlaile")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_gouhuo")
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
						"eventstory_Logan_01a_28"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
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
						modelId = "Model_XHMao_wolf_2",
						id = "loganheibian",
						rotationX = 0,
						scale = 0.11,
						zorder = 350,
						position = {
							x = 0,
							y = 233,
							refpt = {
								x = 0,
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
						modelId = "Model_XHMao_wolf_2",
						id = "loganbaibian",
						rotationX = 0,
						scale = 0.106,
						zorder = 355,
						position = {
							x = 0,
							y = 233,
							refpt = {
								x = 0,
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
						modelId = "Model_XHMao_wolf_2",
						id = "logan",
						rotationX = 0,
						scale = 0.1,
						zorder = 360,
						position = {
							x = 0,
							y = 233,
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
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		sequential({
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
									x = 0.56,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.56,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.56,
									y = 0.1
								}
							}
						}
					end
				})
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_qiangsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
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
									x = 0.66,
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
									x = 0.66,
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
									x = 0.66,
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
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_qiangsheng")
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
							"eventstory_Logan_01a_29"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		concurrent({
			concurrent({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							scale = 0.86,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							scale = 0.856,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							scale = 0.85,
							duration = 0.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
			act({
				action = "play",
				actor = __getnode__(_root, "yin_langlaile"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
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
									x = 0.76,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.76,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.76,
									y = 0.1
								}
							}
						}
					end
				})
			})
		}),
		concurrent({
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
									x = 0.86,
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
									x = 0.86,
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
									x = 0.86,
									y = 0
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							scale = 1.51,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							scale = 1.506,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							scale = 1.5,
							duration = 0.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -763,
								refpt = {
									x = 0,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -763,
								refpt = {
									x = 0,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -763,
								refpt = {
									x = 0,
									y = 0
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "logan"),
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
					duration = 0.6
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_langlaile")
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
							"eventstory_Logan_01a_30"
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
							"eventstory_Logan_01a_31"
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
					duration = 0.4
				}
			end
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
			action = "stop",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_tonghuamengjing")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		})
	})
end

local function eventstory_Logan_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Logan_01a",
					scene = scene_eventstory_Logan_01a
				}
			end
		})
	})
end

stories.eventstory_Logan_01a = eventstory_Logan_01a

return _M
