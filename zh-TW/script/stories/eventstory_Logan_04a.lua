local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Logan_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Logan_04a = {
	actions = {}
}
scenes.scene_eventstory_Logan_04a = scene_eventstory_Logan_04a

function scene_eventstory_Logan_04a:stage(args)
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
						name = "bg_tonghuamengjing",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_story_12.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_tonghuamengjing",
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
						name = "bg_tonghuasenlin",
						pathType = "SCENE",
						type = "Image",
						image = "musicfestival_fb_bg1.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_tonghuasenlin",
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
						name = "bg_juguai",
						pathType = "SCENE",
						type = "Image",
						image = "bg_pve_cg_06.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_juguai",
						scale = 1.3,
						anchorPoint = {
							x = 0.5,
							y = 0.22
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				}
			},
			{
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 100,
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
				id = "Mus_tonghuamengjing",
				fileName = "Mus_Story_Knight_Tranquility",
				type = "Music"
			},
			{
				id = "Mus_tonghuazhandou",
				fileName = "Mus_Battle_Detective",
				type = "Music"
			},
			{
				id = "yin_mengyan",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "yin_qiang",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				id = "yin_lizhua",
				fileName = "Se_Story_Impact_3",
				type = "Sound"
			},
			{
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_ailisijingong",
				fileName = "Se_Skill_Magic_Fire_2",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_ailisi",
				scale = 1.5,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0,
						y = 0.1
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_gedang",
				scale = 1.05,
				actionName = "beiji_juqingtexiao",
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
				zorder = 300,
				visible = false,
				id = "xiao_zhua1",
				scale = 0.5,
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
				zorder = 300,
				visible = false,
				id = "xiao_zhua2",
				scale = 0.4,
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
				zorder = 300,
				visible = false,
				id = "xiao_zhua3",
				scale = 0.4,
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
				id = "xiao_zidan",
				scale = 1.5,
				actionName = "qiangpao_gongji_juqing",
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
				visible = false,
				type = "VideoSprite",
				zorder = 13000,
				videoName = "story_baozha",
				id = "xiao_dabaozha",
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

function scene_eventstory_Logan_04a.actions.start_eventstory_Logan_04a(_root, args)
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
			actor = __getnode__(_root, "bg_tonghuamengjing")
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
						zorder = 300,
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
								x = 0.85,
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
								x = 0.85,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "lbi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "lbi/face_lbi_2.png",
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
						modelId = "Model_TLSi",
						id = "ldaheibian",
						rotationX = 0,
						scale = 0.81,
						zorder = 400,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.1,
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
								x = 0.1,
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
								x = 0.1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "lda_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "lda/face_lda_5.png",
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
				action = "orbitCamera",
				actor = __getnode__(_root, "ldaheibian"),
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
				actor = __getnode__(_root, "ldabaibian"),
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
				actor = __getnode__(_root, "lda"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = -255,
						modelId = "Model_ALSi",
						id = "ALSiheibian",
						rotationX = 0,
						scale = 0.58,
						zorder = 100,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.49,
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
						zorder = 105,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.49,
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
						zorder = 110,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.49,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ALSi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ALSi/ALSi_face_2.png",
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
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
						"eventstory_Logan_04a_1"
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
						"lda"
					},
					content = {
						"eventstory_Logan_04a_2"
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
				action = "updateNode",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						zorder = 500
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						zorder = 505
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						zorder = 510
					}
				end
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.57,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.57,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.57,
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.57,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.57,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.57,
								y = 0.1
							}
						}
					}
				end
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
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.57,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.57,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.57,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi/ALSi_face_6.png",
					pathType = "STORY_FACE"
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
			concurrent({
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
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.59,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.59,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.59,
									y = 0
								}
							}
						}
					end
				})
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi/ALSi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
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
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0.1
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
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = 0.43,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi/ALSi_face_6.png",
					pathType = "STORY_FACE"
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
			concurrent({
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "ALSiheibian"),
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
					actor = __getnode__(_root, "ALSibaibian"),
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
					actor = __getnode__(_root, "ALSi"),
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
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.41,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.41,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.41,
									y = 0
								}
							}
						}
					end
				})
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -175,
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_9",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi"
					},
					content = {
						"eventstory_Logan_04a_3"
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
				actor = __getnode__(_root, "yin_mengyan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 4,
						strength = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALSi/ALSi_face_5.png",
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
						image = "lbi/face_lbi_2.png",
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
						image = "lda/face_lda_3.png",
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
			actor = __getnode__(_root, "yin_mengyan")
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						zorder = 100
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						zorder = 105
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						zorder = 110
					}
				end
			}),
			sequential({
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
					action = "changeTexture",
					actor = __getnode__(_root, "lda_face"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "lda/face_lda_5.png",
							pathType = "STORY_FACE"
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
					action = "orbitCamera",
					actor = __getnode__(_root, "ldaheibian"),
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
					actor = __getnode__(_root, "ldabaibian"),
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
					actor = __getnode__(_root, "lda"),
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
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0,
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
							duration = 0,
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
							duration = 0,
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
						"eventstory_Logan_04a_4"
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
		sequential({
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
									y = 0.08
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
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
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
									y = 0.08
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
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
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							zorder = 500
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							zorder = 505
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							zorder = 510
						}
					end
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_9",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALSi"
						},
						content = {
							"eventstory_Logan_04a_5"
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
					name = "Logan_dialog_speak_name_9",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi"
					},
					content = {
						"eventstory_Logan_04a_6"
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
			action = "play",
			actor = __getnode__(_root, "Mus_tonghuazhandou"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		concurrent({
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juguai"),
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
						brightness = -255,
						modelId = "Model_PNCao",
						id = "PNCaoheibian",
						rotationX = 0,
						scale = 0.11,
						zorder = 1600,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.5,
								y = 0.6
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
						scale = 0.106,
						zorder = 1605,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.5,
								y = 0.6
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
						scale = 0.1,
						zorder = 1610,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.5,
								y = 0.6
							}
						},
						children = {
							{
								resType = 0,
								name = "PNCao_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "PNCao/PNCao_face_6.png",
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
			})
		}),
		sequential({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			concurrent({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				})
			})
		}),
		concurrent({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.2,
									y = 0.2
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.2,
									y = 0.2
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.2,
									y = 0.2
								}
							}
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							scale = 0.5,
							duration = 0.25
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							scale = 0.496,
							duration = 0.25
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							scale = 0.49,
							duration = 0.25
						}
					end
				})
			}),
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
			})
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.5,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.5,
						duration = 0
					}
				end
			}),
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
								x = 0.02,
								y = 0.3
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
								x = -0.08,
								y = 0.3
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
								x = 0.12,
								y = 0.3
							}
						}
					}
				end
			})
		}),
		concurrent({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							scale = 0.71,
							duration = 0.3
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							scale = 0.706,
							duration = 0.3
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							scale = 0.7,
							duration = 0.3
						}
					end
				})
			}),
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
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.55
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_9",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Logan_dialog_speak_name_8"
					},
					content = {
						"eventstory_Logan_04a_7"
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
				actor = __getnode__(_root, "PNCao_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PNCao/PNCao_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_10",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PNCao"
						},
						content = {
							"eventstory_Logan_04a_8"
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
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							scale = 1.01,
							duration = 0.1
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							scale = 1.006,
							duration = 0.1
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							scale = 1,
							duration = 0.1
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
				})
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
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
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
			}),
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
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
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
						duration = 0,
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
						duration = 0,
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
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						zorder = 100
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						zorder = 104
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						zorder = 108
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						zorder = 200
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						zorder = 204
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						zorder = 208
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
				action = "moveTo",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -375,
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
		concurrent({
			concurrent({
				act({
					action = "updateNode",
					actor = __getnode__(_root, "lbiheibian"),
					args = function (_ctx)
						return {
							zorder = 250
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "lbibaibian"),
					args = function (_ctx)
						return {
							zorder = 254
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "lbi"),
					args = function (_ctx)
						return {
							zorder = 258
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
							"eventstory_Logan_04a_9"
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
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -375,
								refpt = {
									x = 0.45,
									y = 0
								}
							}
						}
					end
				})
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
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_04a_10"
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
					name = "Logan_dialog_speak_name_1",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"lda"
					},
					content = {
						"eventstory_Logan_04a_11"
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
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_04a_12"
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						zorder = 600
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						zorder = 604
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						zorder = 608
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_juguai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
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
						scale = 0.75,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.75,
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
								x = 0.52,
								y = 0.6
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
								x = 0.42,
								y = 0.6
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
								x = 0.62,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.7,
								y = 0.6
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						scale = 0.71,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						scale = 0.706,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "PNCao_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "PNCao/PNCao_face_4.png",
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
		sequential({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_10",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PNCao"
						},
						content = {
							"eventstory_Logan_04a_13"
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
					actor = __getnode__(_root, "yin_mengyan"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
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
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
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
				actor = __getnode__(_root, "yin_mengyan")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_gedang")
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi/ALSi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
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
				action = "moveTo",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -175,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi"),
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.25,
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
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_9",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALSi"
						},
						content = {
							"eventstory_Logan_04a_14"
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
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -175,
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
					duration = 0.2
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
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
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
				action = "moveTo",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
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
				action = "moveTo",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0,
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
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi/ALSi_face_4.png",
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
					image = "PNCao/PNCao_face_5.png",
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_ailisi"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_ailisijingong"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_ailisi"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_ailisi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							refpt = {
								x = 0.4,
								y = 0.4
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_ailisi"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_ailisi"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							refpt = {
								x = 0.5,
								y = 0.3
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
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_ailisi")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_ailisijingong")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_ailisi")
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
				action = "play",
				actor = __getnode__(_root, "yin_mengyan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 4,
						strength = 1
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "PNCao_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "PNCao/PNCao_face_7.png",
					pathType = "STORY_FACE"
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
			action = "stop",
			actor = __getnode__(_root, "yin_mengyan")
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
						scale = 0.75,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.75,
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
								x = 0.88,
								y = 0.6
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
								x = 0.78,
								y = 0.6
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
								x = 0.98,
								y = 0.6
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						zorder = 1600
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						zorder = 1604
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						zorder = 1608
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0.7
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0.7
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0.7
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
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							scale = 1.01,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							scale = 1.006,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							scale = 1,
							duration = 0.2
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
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.2
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
									x = 0.42,
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
									x = 0.32,
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
									x = 0.52,
									y = 0.4
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "yin_mengyan"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
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
								x = 0.5,
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
								x = 0.5,
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
								x = 0.5,
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0.7
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0.7
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0.7
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
			})
		}),
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
					duration = 0.1
				}
			end
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lda"),
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
						"eventstory_Logan_04a_15"
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
						"eventstory_Logan_04a_16"
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
						"eventstory_Logan_04a_17"
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
			action = "changeTexture",
			actor = __getnode__(_root, "PNCao_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "PNCao/PNCao_face_4.png",
					pathType = "STORY_FACE"
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
						scale = 1,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.8,
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
								x = 0.12,
								y = 0.6
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
								x = 0.02,
								y = 0.6
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
								x = 0.22,
								y = 0.6
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						scale = 0.71,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						scale = 0.706,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_juguai"),
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCao"),
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
		concurrent({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.3
								}
							}
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							scale = 1.01,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							scale = 1.006,
							duration = 0.2
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							scale = 1,
							duration = 0.2
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
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.2
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
									x = 0.22,
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
									x = 0.12,
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
									x = 0.32,
									y = 0.4
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "yin_mengyan"),
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						scale = 0.71,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						scale = 0.706,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_mengyan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zhua3"),
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
					duration = 0.1
				}
			end
		}),
		concurrent({
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Logan_dialog_speak_name_10",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PNCao"
					},
					content = {
						"eventstory_Logan_04a_18"
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
				actor = __getnode__(_root, "bg_juguai"),
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
			}),
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
							"eventstory_Logan_04a_19"
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
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -375,
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
							"eventstory_Logan_04a_20"
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
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_juguai"),
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
			}),
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
						scale = 1,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 0.85,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 0.85,
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
								x = 0.88,
								y = 0.6
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
								x = 0.78,
								y = 0.6
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
								x = 0.98,
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
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "yin_mengyan"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
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
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.06
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.06
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.5,
									y = -0.06
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
						name = "Logan_dialog_speak_name_10",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PNCao"
						},
						content = {
							"eventstory_Logan_04a_21"
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
				action = "stop",
				actor = __getnode__(_root, "yin_mengyan")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_gedang")
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
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
						scale = 1.2,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua2"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_zhua3"),
				args = function (_ctx)
					return {
						scale = 1,
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
								x = 0.17,
								y = 0.7
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
								x = 0.27,
								y = 0.7
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
								x = 0.07,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_zidan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.35,
								y = 0.7
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zidan"),
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
				actor = __getnode__(_root, "yin_gedang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zidan")
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
						"eventstory_Logan_04a_22"
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
		sequential({
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
			actor = __getnode__(_root, "xiao_zidan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.15,
							y = 0.3
						}
					}
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
				actor = __getnode__(_root, "xiao_zidan"),
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
				action = "stop",
				actor = __getnode__(_root, "yin_qiang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zidan")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zidan")
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_zidan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.65,
							y = 0.2
						}
					}
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
				actor = __getnode__(_root, "xiao_zidan"),
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
				action = "stop",
				actor = __getnode__(_root, "yin_qiang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zidan")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zidan")
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_zidan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.4,
							y = 0.22
						}
					}
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_zidan"),
			args = function (_ctx)
				return {
					scale = 2,
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
		act({
			action = "play",
			actor = __getnode__(_root, "yin_qiang"),
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_zidan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 4,
						strength = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_mengyan"),
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
				action = "stop",
				actor = __getnode__(_root, "yin_qiang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_zidan")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_mengyan")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_zidan")
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
						"eventstory_Logan_04a_23"
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
			action = "play",
			actor = __getnode__(_root, "xiao_dabaozha"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_dabaozha")
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
			actor = __getnode__(_root, "Mus_tonghuamengjing"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tonghuamengjing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
			actor = __getnode__(_root, "bg_tonghuasenlin"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALSi/ALSi_face_1.png",
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
						image = "lda/face_lda_5.png",
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
				action = "moveTo",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -420,
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
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -175,
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
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -175,
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
				action = "orbitCamera",
				actor = __getnode__(_root, "ldaheibian"),
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
				actor = __getnode__(_root, "ldabaibian"),
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
				actor = __getnode__(_root, "lda"),
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
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
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
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 1.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSiheibian"),
				args = function (_ctx)
					return {
						zorder = 503
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						zorder = 506
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSi"),
				args = function (_ctx)
					return {
						zorder = 509
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						zorder = 403
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbibaibian"),
				args = function (_ctx)
					return {
						zorder = 406
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lbi"),
				args = function (_ctx)
					return {
						zorder = 409
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						zorder = 303
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						zorder = 306
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						zorder = 309
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldaheibian"),
				args = function (_ctx)
					return {
						zorder = 203
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldabaibian"),
				args = function (_ctx)
					return {
						zorder = 206
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lda"),
				args = function (_ctx)
					return {
						zorder = 209
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
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSibaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi"),
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaoheibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCaobaibian"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PNCao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
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
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -175,
								refpt = {
									x = 0.49,
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
						name = "Logan_dialog_speak_name_9",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALSi"
						},
						content = {
							"eventstory_Logan_04a_24"
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
					name = "Logan_dialog_speak_name_10",
					dialogImage = "storybook_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PNCao"
					},
					content = {
						"eventstory_Logan_04a_25"
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
							duration = 0.25,
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
							duration = 0.25,
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
							duration = 0.25,
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
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_04a_26"
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.25,
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.25,
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
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALSi/ALSi_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_9",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALSi"
						},
						content = {
							"eventstory_Logan_04a_27"
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
							"eventstory_Logan_04a_28"
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
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -175,
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
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -175,
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
				actor = __getnode__(_root, "ALSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALSi/ALSi_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_9",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALSi"
						},
						content = {
							"eventstory_Logan_04a_29"
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
					action = "updateNode",
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							zorder = 203
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							zorder = 206
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							zorder = 209
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
								refpt = {
									x = 0.7,
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
					actor = __getnode__(_root, "ALSiheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSibaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
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
					action = "moveTo",
					actor = __getnode__(_root, "ALSi"),
					args = function (_ctx)
						return {
							duration = 0.1,
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
					action = "moveTo",
					actor = __getnode__(_root, "PNCaoheibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCaobaibian"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
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
					actor = __getnode__(_root, "PNCao"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -420,
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_10",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PNCao"
						},
						content = {
							"eventstory_Logan_04a_30"
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
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PNCao_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PNCao/PNCao_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Logan_dialog_speak_name_10",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PNCao"
						},
						content = {
							"eventstory_Logan_04a_31"
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
						name = "Logan_dialog_speak_name_10",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PNCao"
						},
						content = {
							"eventstory_Logan_04a_32"
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
						duration = 0.15,
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
				action = "moveTo",
				actor = __getnode__(_root, "lbiheibian"),
				args = function (_ctx)
					return {
						duration = 0.15,
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
						duration = 0.15,
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
						duration = 0.15,
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PNCao_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PNCao/PNCao_face_1.png",
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
							"eventstory_Logan_04a_33"
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
							duration = 0.2,
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
							duration = 0.2,
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
							"eventstory_Logan_04a_34"
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
							"eventstory_Logan_04a_35"
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
							"eventstory_Logan_04a_36"
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
						name = "Logan_dialog_speak_name_2",
						dialogImage = "storybook_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"lbi"
						},
						content = {
							"eventstory_Logan_04a_37"
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
					duration = 0.4
				}
			end
		}),
		concurrent({
			concurrent({
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "ldaheibian"),
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
					actor = __getnode__(_root, "ldabaibian"),
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
					actor = __getnode__(_root, "lda"),
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
					actor = __getnode__(_root, "ldaheibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "ldabaibian"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -375,
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
					actor = __getnode__(_root, "lda"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -375,
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
							"eventstory_Logan_04a_38"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_tonghuamengjing")
		})
	})
end

local function eventstory_Logan_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Logan_04a",
					scene = scene_eventstory_Logan_04a
				}
			end
		})
	})
end

stories.eventstory_Logan_04a = eventstory_Logan_04a

return _M
