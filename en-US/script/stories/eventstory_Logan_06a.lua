local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Logan_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Logan_06a = {
	actions = {}
}
scenes.scene_eventstory_Logan_06a = scene_eventstory_Logan_06a

function scene_eventstory_Logan_06a:stage(args)
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
						name = "bg_tonghuasenlinye",
						pathType = "SCENE",
						type = "Image",
						image = "musicfestival_fb_bg2.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_tonghuasenlinye",
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
						name = "cg_tongmian",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_storybook_1.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "cg_tongmian",
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
				zorder = 10,
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
				resType = 0,
				name = "bg_tonghuamengjing_qian",
				pathType = "STORY_ALPHA",
				type = "Image",
				image = "scene_story_story_21.png",
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
				id = "Mus_tonghuamengjing",
				fileName = "Mus_Story_Knight_Tranquility",
				type = "Music"
			},
			{
				id = "yin_siyao",
				fileName = "Se_Story_Muou_Attack",
				type = "Sound"
			},
			{
				id = "yin_shuaidao",
				fileName = "Se_Story_Bodyfall",
				type = "Sound"
			},
			{
				id = "yin_lizhua",
				fileName = "Se_Story_Impact_3",
				type = "Sound"
			},
			{
				id = "yin_qiang",
				fileName = "Se_Skill_Gun",
				type = "Sound"
			},
			{
				id = "yin_weisui",
				fileName = "Se_Story_Step",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_zhua1",
				scale = 0.9,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.27,
						y = 0.25
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_zhua2",
				scale = 0.8,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.37,
						y = 0.25
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_zhua3",
				scale = 0.8,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.17,
						y = 0.25
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Logan_06a.actions.start_eventstory_Logan_06a(_root, args)
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
					center = 2,
					content = {
						"eventstory_Logan_06a_1",
						"eventstory_Logan_06a_2",
						"eventstory_Logan_06a_3",
						"eventstory_Logan_06a_4",
						"eventstory_Logan_06a_5",
						"eventstory_Logan_06a_6"
					},
					durations = {
						0.08,
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
			action = "show",
			actor = __getnode__(_root, "colorBg"),
			args = function (_ctx)
				return {
					bgColor = "#ffffff"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuamengjing_qian"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
						zorder = 103,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.32,
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
						zorder = 103,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.32,
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
						brightness = -255,
						modelId = "Model_XHMao_single",
						id = "lbiying",
						rotationX = 0,
						scale = 0.71,
						zorder = 109,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.32,
								y = 0
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
				actor = __getnode__(_root, "lbiying"),
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
						modelId = "Model_Enemy_MYLang",
						id = "langheibian",
						rotationX = 0,
						scale = 1.01,
						zorder = 203,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.4,
								y = 0.25
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
						modelId = "Model_Enemy_MYLang",
						id = "langbaibian",
						rotationX = 0,
						scale = 1.006,
						zorder = 206,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.4,
								y = 0.25
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
						brightness = -255,
						modelId = "Model_Enemy_MYLang",
						id = "lang",
						rotationX = 0,
						scale = 1,
						zorder = 206,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.4,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lang"),
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
						modelId = "Model_XHMao_wolf_2",
						id = "loganheibian",
						rotationX = 0,
						scale = 0.86,
						zorder = 303,
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = 255,
						modelId = "Model_XHMao_wolf_2",
						id = "loganbaibian",
						rotationX = 0,
						scale = 0.856,
						zorder = 306,
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_XHMao_wolf_2",
						id = "logan",
						rotationX = 0,
						scale = 0.85,
						zorder = 309,
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
				actor = __getnode__(_root, "lbiying"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lang"),
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_siyao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.4,
									y = 0.17
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.4,
									y = 0.17
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.4,
									y = 0.17
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
				action = "stop",
				actor = __getnode__(_root, "yin_siyao")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zhua3")
			})
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_zhua1"),
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
				actor = __getnode__(_root, "xiao_zhua2"),
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
				actor = __getnode__(_root, "xiao_zhua3"),
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
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.73,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.63,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.83,
								y = 0.25
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_siyao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.4,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.4,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.4,
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
				action = "stop",
				actor = __getnode__(_root, "yin_siyao")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zhua3")
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_qiang")
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
			actor = __getnode__(_root, "yin_qiang")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_weisui"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.9,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.25,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.9,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.25,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.9,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.25,
									y = 0.25
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
							duration = 0.9,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.9,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbiying"),
					args = function (_ctx)
						return {
							duration = 0.9,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.8,
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
					duration = 0.9
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_weisui")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shuaidao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -250,
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
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -250,
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
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.25,
									y = 0.1
								}
							}
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_7"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_8"
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
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.55,
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
							duration = 0.3,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.55,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiying"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.55,
									y = -0.1
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
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_9"
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
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.65,
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
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.65,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiying"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.65,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.25,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.25,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.25,
								y = 0.25
							}
						}
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_10"
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
					name = "Logan_dialog_speak_name_11",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_11"
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
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
				actor = __getnode__(_root, "langbaibian"),
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
				actor = __getnode__(_root, "lang"),
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
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbiying"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.9,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.9,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.9,
								y = 0.25
							}
						}
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_12"
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
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
				actor = __getnode__(_root, "langbaibian"),
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
				actor = __getnode__(_root, "lang"),
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = -0.45,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = -0.45,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = -0.45,
								y = 0.25
							}
						}
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
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.4,
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
							duration = 0.4,
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
					actor = __getnode__(_root, "lbiying"),
					args = function (_ctx)
						return {
							duration = 0.4,
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.6,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.6,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.6,
									y = 0.25
								}
							}
						}
					end
				})
			})
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "langheibian"),
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
				actor = __getnode__(_root, "langbaibian"),
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
				actor = __getnode__(_root, "lang"),
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1,
								y = 0.25
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.45,
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
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.45,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiying"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.45,
									y = -0.1
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
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_13"
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
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1,
									y = 0.35
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1,
									y = 0.35
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1,
									y = 0.35
								}
							}
						}
					end
				})
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
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1,
									y = 0.25
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
						name = "Logan_dialog_speak_name_11",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_14"
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
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
							duration = 0.15,
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
					actor = __getnode__(_root, "lbiying"),
					args = function (_ctx)
						return {
							duration = 0.15,
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_15"
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
					name = "Logan_dialog_speak_name_11",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_16"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_17"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_18"
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
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.3,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiying"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.3,
								y = -0.1
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
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
				actor = __getnode__(_root, "langbaibian"),
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
				actor = __getnode__(_root, "lang"),
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.1,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.1,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.1,
								y = 0.15
							}
						}
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_19"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_20"
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
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_21"
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.65,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.65,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.65,
								y = 0.25
							}
						}
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
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_12",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_22"
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
			action = "stop",
			actor = __getnode__(_root, "yin_siyao")
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
								x = 0.65,
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
								x = 0.65,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lbiying"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.65,
								y = 0
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.2,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.2,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.2,
								y = 0.25
							}
						}
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_23"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_24"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_25"
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "langheibian"),
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
				actor = __getnode__(_root, "langbaibian"),
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
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						scale = 1.41,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						scale = 1.406,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						scale = 1.4,
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_26"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_27"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_28"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_29"
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
					action = "moveTo",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.3,
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
									x = 0.3,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lbiying"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.3,
									y = -0.1
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
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_30"
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.9,
									y = 0.15
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.9,
									y = 0.15
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.9,
									y = 0.15
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
						name = "Logan_dialog_speak_name_12",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_31"
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
				actor = __getnode__(_root, "lbiying"),
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
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
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
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
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
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = -0.2,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "langheibian"),
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
				actor = __getnode__(_root, "langbaibian"),
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
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						scale = 1.51,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						scale = 1.506,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						zorder = 53
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						zorder = 56
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lang"),
				args = function (_ctx)
					return {
						zorder = 59
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_32"
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
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -250,
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
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -250,
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
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.45,
									y = 0
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.45,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "langbaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.45,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lang"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.45,
									y = -0.1
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
						name = "Logan_dialog_speak_name_12",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_06a_33"
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_34"
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
			action = "hide",
			actor = __getnode__(_root, "colorBg")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tonghuamengjing_qian"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_tongmian"),
			args = function (_ctx)
				return {
					duration = 0
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
				actor = __getnode__(_root, "lbiying"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "langheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "langbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "lang"),
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_35"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_36"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_37"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_38"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_39"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_40"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_41"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_42"
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
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_43"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_06a_44"
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
			actor = __getnode__(_root, "cg_tongmian"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuasenlinye"),
			args = function (_ctx)
				return {
					duration = 0
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
							x = 0.46,
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
						duration = 0,
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
						duration = 0,
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
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						zorder = 300
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						zorder = 303
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
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						zorder = 203
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						zorder = 206
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						zorder = 209
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "logan"),
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_06a_45"
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
							"eventstory_Logan_06a_46"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"logan"
					},
					content = {
						"eventstory_Logan_06a_47"
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
						"eventstory_Logan_06a_48"
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
					name = "Logan_dialog_speak_name_12",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"logan"
					},
					content = {
						"eventstory_Logan_06a_49"
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
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_tonghuamengjing")
		})
	})
end

local function eventstory_Logan_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Logan_06a",
					scene = scene_eventstory_Logan_06a
				}
			end
		})
	})
end

stories.eventstory_Logan_06a = eventstory_Logan_06a

return _M
