local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Logan_07a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Logan_07a = {
	actions = {}
}
scenes.scene_eventstory_Logan_07a = scene_eventstory_Logan_07a

function scene_eventstory_Logan_07a:stage(args)
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
						name = "bg_tonghuabenghuai",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_story_12.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_tonghuabenghuai",
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
						name = "bg_tonghuabingyuan",
						pathType = "SCENE",
						type = "Image",
						image = "ybxrdxh_fb_Snowflake_bg.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_tonghuabingyuan",
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
				name = "bg_tonghuabenghuai_qian",
				pathType = "STORY_ALPHA",
				type = "Image",
				image = "scene_story_story_11.png",
				layoutMode = 1,
				zorder = 9998,
				id = "bg_tonghuabenghuai_qian",
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
				name = "hide_huai1",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 12000,
				opacity = 0.3,
				id = "hide_huai1",
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
				resType = 0,
				name = "hide_huai2",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 14000,
				opacity = 0.6,
				id = "hide_huai2",
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
				resType = 0,
				name = "hide_huai3",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 16000,
				opacity = 0.9,
				id = "hide_huai3",
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
				id = "Mus_tonghuameihao",
				fileName = "Mus_Story_Knight_Tranquility",
				type = "Music"
			},
			{
				id = "Mus_tonghuaposui",
				fileName = "Mus_Story_Knight_Tranquility",
				type = "Music"
			},
			{
				id = "yin_lizhua",
				fileName = "Se_Story_Impact_3",
				type = "Sound"
			},
			{
				id = "yin_diren",
				fileName = "Se_Skill_Magic_Impact_2",
				type = "Sound"
			},
			{
				id = "yin_qiang",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				id = "yin_siyao",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_zhua1",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.52,
						y = 0.3
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_diren",
				scale = 1.05,
				actionName = "mofa_gongji_juqing",
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
				zorder = 10000,
				visible = false,
				id = "xiao_zhua2",
				scale = 0.95,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.42,
						y = 0.3
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_zhua3",
				scale = 0.95,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.62,
						y = 0.3
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1800,
				visible = false,
				id = "xiao_linda",
				scale = 2,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.15,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1900,
				visible = false,
				id = "xiao_lubi",
				scale = 1.5,
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
				id = "flashMask",
				type = "FlashMask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Logan_07a.actions.start_eventstory_Logan_07a(_root, args)
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
			actor = __getnode__(_root, "bg_tonghuabenghuai")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuabenghuai_qian"),
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
								x = 0.55,
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
								x = 0.55,
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
								x = 0.55,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "lbi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "lbi/face_lbi_1.png",
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = -255,
						modelId = "Model_XHMao_wolf_2",
						id = "loganheibian",
						rotationX = 0,
						scale = 0.86,
						zorder = 350,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.43,
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
						zorder = 355,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.43,
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
						zorder = 360,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.43,
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
				action = "fadeIn",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbi"),
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_07a_1"
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
								x = 0.68,
								y = 0.5
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
								x = 0.58,
								y = 0.5
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
								x = 0.78,
								y = 0.5
							}
						}
					}
				end
			})
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
							"Logan_dialog_speak_name_8"
						},
						content = {
							"eventstory_Logan_07a_2"
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
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								refpt = {
									x = 0.68,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.58,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.78,
									y = 0.4
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
					action = "flashScreen",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							arr = {
								{
									color = "#FF0000",
									fadeout = 0,
									alpha = 1,
									duration = 0.3,
									fadein = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							duration = 0.3
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
									x = 0.45,
									y = -0.07
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
									x = 0.45,
									y = -0.07
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
									x = 0.45,
									y = -0.07
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
							"eventstory_Logan_07a_3"
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
				action = "stop",
				actor = __getnode__(_root, "yin_lizhua")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua3")
			})
		}),
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.35,
									y = -0.07
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
							duration = 0.3,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.35,
									y = -0.07
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
							duration = 0.3,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.35,
									y = -0.07
								}
							}
						}
					end
				})
			}),
			concurrent({
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
									x = 0.35,
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
									x = 0.35,
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
									x = 0.35,
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
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
							duration = 0.2,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
				})
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
							"eventstory_Logan_07a_4"
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
							"eventstory_Logan_07a_5"
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
						"lbi"
					},
					content = {
						"eventstory_Logan_07a_6"
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
				actor = __getnode__(_root, "lda_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lda/face_lda_5.png",
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
							"eventstory_Logan_07a_7"
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
							"eventstory_Logan_07a_8"
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
			action = "moveTo",
			actor = __getnode__(_root, "xiao_lubi"),
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
			action = "orbitCamera",
			actor = __getnode__(_root, "xiao_lubi"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.9,
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
		sequential({
			concurrent({
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
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_qiang"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_lubi"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.3,
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
					duration = 0.3
				}
			end
		}),
		concurrent({
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
							"eventstory_Logan_07a_9"
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
						"eventstory_Logan_07a_10"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_zhua1"),
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
				actor = __getnode__(_root, "xiao_zhua2"),
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
				actor = __getnode__(_root, "xiao_zhua3"),
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
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.32,
								y = 0.5
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
								x = 0.22,
								y = 0.5
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
								x = 0.42,
								y = 0.5
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
						"eventstory_Logan_07a_11"
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
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								refpt = {
									x = 0.48,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.38,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.58,
									y = 0.4
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
					action = "flashScreen",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							arr = {
								{
									color = "#FF0000",
									fadeout = 0,
									alpha = 1,
									duration = 0.3,
									fadein = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							duration = 0.3
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
									x = 0.55,
									y = -0.07
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
									x = 0.55,
									y = -0.07
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
									x = 0.55,
									y = -0.07
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
							"eventstory_Logan_07a_12"
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
						"eventstory_Logan_07a_13"
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
						"eventstory_Logan_07a_14"
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
						"eventstory_Logan_07a_15"
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
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_07a_16"
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
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.25,
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
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.9,
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
				action = "changeTexture",
				actor = __getnode__(_root, "lda_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lda/face_lda_5.png",
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
							"eventstory_Logan_07a_17"
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
				actor = __getnode__(_root, "xiao_linda"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_linda"),
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
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_lubi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.6,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_lubi"),
				args = function (_ctx)
					return {
						deltaAngle = 45,
						duration = 0
					}
				end
			})
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
						duration = 0,
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
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0,
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
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_qiang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_lubi"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_linda")
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
				action = "stop",
				actor = __getnode__(_root, "yin_qiang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_lubi")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_lubi")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_linda")
			})
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
							"eventstory_Logan_07a_18"
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
								x = 1.13,
								y = 0.5
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
								x = 1.03,
								y = 0.5
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
								x = 1.23,
								y = 0.5
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
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lda"
					},
					content = {
						"eventstory_Logan_07a_19"
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
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								refpt = {
									x = 1.13,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 1.03,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 1.23,
									y = 0.4
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
					action = "flashScreen",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							arr = {
								{
									color = "#FF0000",
									fadeout = 0,
									alpha = 1,
									duration = 0.3,
									fadein = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							duration = 0.3
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
									x = 0.8,
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
									x = 0.8,
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
									x = 0.8,
									y = -0.1
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
							"eventstory_Logan_07a_20"
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
				action = "stop",
				actor = __getnode__(_root, "yin_lizhua")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua3")
			})
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 1
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
							"eventstory_Logan_07a_21"
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
				actor = __getnode__(_root, "lda_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "lda/face_lda_5.png",
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
							"eventstory_Logan_07a_22"
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
							duration = 0.1,
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
							duration = 0.1,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.1,
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
							"eventstory_Logan_07a_23"
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
								x = 0.9,
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
								x = 0.9,
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
								x = 0.9,
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
					duration = 0.05
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
								x = 1.3,
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
								x = 1.3,
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
								x = 1.3,
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
					duration = 0.3
				}
			end
		}),
		concurrent({
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
						duration = 0,
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
						duration = 0,
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						scale = 0.9,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
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
								x = 0.68,
								y = 0.55
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
								x = 0.58,
								y = 0.55
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
								x = 0.78,
								y = 0.55
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
						"eventstory_Logan_07a_24"
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
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								refpt = {
									x = 0.68,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.58,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.78,
									y = 0.4
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
					action = "flashScreen",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							arr = {
								{
									color = "#FF0000",
									fadeout = 0,
									alpha = 1,
									duration = 0.3,
									fadein = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							duration = 0.3
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
							duration = 0.1,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.1,
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
							"lbi"
						},
						content = {
							"eventstory_Logan_07a_25"
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
				action = "stop",
				actor = __getnode__(_root, "yin_lizhua")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua3")
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
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_zhua1"),
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
				actor = __getnode__(_root, "xiao_zhua2"),
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
				actor = __getnode__(_root, "xiao_zhua3"),
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
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.6,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.6,
						duration = 0
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
								x = 0.32,
								y = 0.55
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
								x = 0.22,
								y = 0.55
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
								x = 0.42,
								y = 0.55
							}
						}
					}
				end
			})
		}),
		concurrent({
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								refpt = {
									x = 0.32,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.22,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.42,
									y = 0.4
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
					action = "flashScreen",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							arr = {
								{
									color = "#FF0000",
									fadeout = 0,
									alpha = 1,
									duration = 0.3,
									fadein = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "flashMask"),
					args = function (_ctx)
						return {
							duration = 0.3
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
									x = 0.55,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.55,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.55,
									y = -0.15
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
							"eventstory_Logan_07a_26"
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
				action = "stop",
				actor = __getnode__(_root, "yin_lizhua")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua3")
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
							"eventstory_Logan_07a_27"
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
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lda"
					},
					content = {
						"eventstory_Logan_07a_28"
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
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						duration = 1.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						duration = 1.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						duration = 1.2
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
								x = 0.2,
								y = -300,
								refpt = {
									x = 0.38,
									y = -0.63
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
								x = 0.2,
								y = -300,
								refpt = {
									x = 0.38,
									y = -0.63
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
								x = 0.2,
								y = -300,
								refpt = {
									x = 0.38,
									y = -0.63
								}
							}
						}
					end
				}),
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_zhua1"),
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
				actor = __getnode__(_root, "xiao_zhua2"),
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
				actor = __getnode__(_root, "xiao_zhua3"),
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
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						scale = 0.9,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
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
								x = 0.32,
								y = 0.55
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
								x = 0.22,
								y = 0.55
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
								x = 0.42,
								y = 0.55
							}
						}
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
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbi"),
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_siyao")
		}),
		concurrent({
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								refpt = {
									x = 0.32,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.22,
									y = 0.4
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
							duration = 0.1,
							position = {
								refpt = {
									x = 0.42,
									y = 0.4
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_lizhua")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "stop",
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						scale = 0.9,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
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
								x = 0.68,
								y = 0.55
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
								x = 0.58,
								y = 0.55
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
								x = 0.78,
								y = 0.55
							}
						}
					}
				end
			})
		}),
		concurrent({
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_lizhua"),
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_zhua1"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								refpt = {
									x = 0.68,
									y = 0.4
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
									x = 0.58,
									y = 0.4
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
									x = 0.78,
									y = 0.4
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_lizhua")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua3")
			})
		}),
		concurrent({
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "flashMask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FF0000",
								fadeout = 0,
								alpha = 1,
								duration = 0.4,
								fadein = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "flashMask"),
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
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.55,
								y = -0.2
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
								x = 0.55,
								y = -0.2
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
						duration = 0.4,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.55,
								y = -0.2
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tonghuabenghuai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tonghuabenghuai_qian"),
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
				action = "scaleTo",
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						scale = 0.86,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						scale = 0.856,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						scale = 0.85,
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
					duration = 0.4
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
					duration = 0.4
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
						"eventstory_Logan_07a_29"
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
						"eventstory_Logan_07a_30"
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
						"eventstory_Logan_07a_31"
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
			actor = __getnode__(_root, "bg_tonghuasenlinye"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tonghuabingyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
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
			})
		}),
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						scale = 1.2,
						duration = 0
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
								x = 0.68,
								y = 0.3
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
				action = "play",
				actor = __getnode__(_root, "yin_diren"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_diren"),
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
							duration = 0.15,
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
							duration = 0.15,
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
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							duration = 0.15,
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
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_diren")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_diren")
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
						"eventstory_Logan_07a_32"
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
						"eventstory_Logan_07a_33"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "loganheibian"),
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
				actor = __getnode__(_root, "loganbaibian"),
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
				actor = __getnode__(_root, "logan"),
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
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						zorder = 403
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						zorder = 406
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						zorder = 409
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						scale = 0.21,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						scale = 0.206,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_diren"),
				args = function (_ctx)
					return {
						scale = 2.5,
						duration = 0
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
								x = 0.88,
								y = 0.6
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
								x = 0.88,
								y = 0.6
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
								x = 0.88,
								y = 0.6
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
					name = "Logan_dialog_speak_name_2",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lbi"
					},
					content = {
						"eventstory_Logan_07a_34"
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
							"eventstory_Logan_07a_35"
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
				action = "scaleTo",
				actor = __getnode__(_root, "loganheibian"),
				args = function (_ctx)
					return {
						scale = 0.61,
						duration = 0.2
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "loganbaibian"),
				args = function (_ctx)
					return {
						scale = 0.606,
						duration = 0.2
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "logan"),
				args = function (_ctx)
					return {
						scale = 0.6,
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
								x = 0.75,
								y = 0.25
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
								x = 0.75,
								y = 0.25
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
								x = 0.75,
								y = 0.25
							}
						}
					}
				end
			})
		}),
		concurrent({
			concurrent({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							scale = 0.86,
							duration = 0.15
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							scale = 0.856,
							duration = 0.15
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							scale = 0.85,
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
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
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
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
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							duration = 0.15,
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
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.2,
									y = -0.2
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
									x = 0.2,
									y = -0.2
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
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.2,
									y = -0.2
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_diren"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_diren"),
					args = function (_ctx)
						return {
							time = -1
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
		concurrent({
			concurrent({
				act({
					action = "stop",
					actor = __getnode__(_root, "yin_diren")
				}),
				act({
					action = "hide",
					actor = __getnode__(_root, "xiao_diren")
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.65,
									y = -0.3
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
							duration = 0.4,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.65,
									y = -0.3
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
							duration = 0.4,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.65,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "loganheibian"),
					args = function (_ctx)
						return {
							duration = 0.4
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "loganbaibian"),
					args = function (_ctx)
						return {
							duration = 0.4
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "logan"),
					args = function (_ctx)
						return {
							duration = 0.4
						}
					end
				})
			})
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
					duration = 0.7
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_Logan_07a_36"
					},
					durations = {
						0.2
					},
					waitTimes = {
						3
					}
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
			action = "stop",
			actor = __getnode__(_root, "Mus_tonghuameihao")
		})
	})
end

local function eventstory_Logan_07a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Logan_07a",
					scene = scene_eventstory_Logan_07a
				}
			end
		})
	})
end

stories.eventstory_Logan_07a = eventstory_Logan_07a

return _M
