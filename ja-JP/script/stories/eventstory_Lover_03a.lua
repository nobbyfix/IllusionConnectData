local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Lover_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Lover_03a = {
	actions = {}
}
scenes.scene_eventstory_Lover_03a = scene_eventstory_Lover_03a

function scene_eventstory_Lover_03a:stage(args)
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
						name = "bg_juyuan",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_1.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_juyuan",
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
						name = "cg_changmws",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_terror_3.jpg",
						layoutMode = 1,
						zorder = 9,
						id = "cg_changmws",
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
						name = "cg_changaflya",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_terror_4.jpg",
						layoutMode = 1,
						zorder = 8,
						id = "cg_changaflya",
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
						name = "bg_jingtou",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_1.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_jingtou",
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
						name = "bg_juyuan_mohu",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_2.jpg",
						layoutMode = 1,
						zorder = 11,
						id = "bg_juyuan_mohu",
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
						name = "bg_juyuan_po",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_3.jpg",
						layoutMode = 1,
						zorder = 11,
						id = "bg_juyuan_po",
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
						name = "bg_juyuan_po_mohu",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_4.jpg",
						layoutMode = 1,
						zorder = 11,
						id = "bg_juyuan_po_mohu",
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
						name = "bg_zhedang",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 20,
						id = "bg_zhedang",
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
						name = "yan_bankai",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_2.png",
						layoutMode = 1,
						zorder = 100,
						id = "yan_bankai",
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
						name = "yan_weikai",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_3.png",
						layoutMode = 1,
						zorder = 100,
						id = "yan_weikai",
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
				name = "cg_juyuan",
				pathType = "SCENE",
				type = "Image",
				image = "scene_main_terror_2.jpg",
				layoutMode = 1,
				zorder = 5,
				id = "cg_juyuan",
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
				id = "mying_gesheng",
				fileName = "Mus_Story_Terror",
				type = "Music"
			},
			{
				id = "Mus_rensheng",
				fileName = "Se_Story_Amb_Theater",
				type = "Music"
			},
			{
				id = "Mus_mying_jiaobu",
				fileName = "Se_Story_Step",
				type = "Music"
			},
			{
				id = "yin_rensheng",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "mying_jiaobu_up",
				fileName = "Se_Story_Steps_Shoes_a",
				type = "Sound"
			},
			{
				id = "mying_jiaobu",
				fileName = "Se_Story_Step",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "zhongbai",
				scale = 0.9,
				actionName = "shuijing_zhongjian_cuimianshuijing",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Lover_03a.actions.start_eventstory_Lover_03a(_root, args)
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
			action = "updateNode",
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					zorder = 10
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg_juyuan_mohu"),
			args = function (_ctx)
				return {
					zorder = 13
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					zorder = 14
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					zorder = 15
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juyuan_mohu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "yan_weikai"),
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
						modelId = "Model_WSLi",
						id = "aflya",
						rotationX = 0,
						scale = 0.75,
						zorder = 130,
						position = {
							x = 0,
							y = -466,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "aflya"),
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
						modelId = "Model_WSLi",
						id = "aflya_ren",
						rotationX = 0,
						scale = 0.75,
						zorder = 130,
						position = {
							x = 0,
							y = -466,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "aflya_ren"),
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
						modelId = "Model_MYing",
						id = "mwsi",
						rotationX = 0,
						scale = 0.75,
						zorder = 130,
						position = {
							x = 0,
							y = -370.7,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "mwsi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "mwsi/face_mwsi_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "mwsi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 14.94,
									y = 1090.3
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mwsi"),
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
						modelId = "Model_MYing",
						id = "xiasiwole",
						rotationX = 0,
						scale = 1.1,
						zorder = 130,
						position = {
							x = 0,
							y = -500,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "xiasiwole_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "mwsi/face_mwsi_6.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "xiasiwole_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 14.94,
									y = 1090.3
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xiasiwole"),
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
				actor = __getnode__(_root, "xiasiwole"),
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
						modelId = "Model_Story_YDZZong",
						id = "BoyYing",
						rotationX = 0,
						scale = 0.95,
						zorder = 135,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.54,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BoyYing"),
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
						id = "ManYing",
						rotationX = 0,
						scale = 1,
						zorder = 135,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ManYing"),
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
						modelId = "Model_Story_JYing3",
						id = "WomanYing",
						rotationX = 0,
						scale = 1,
						zorder = 135,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.65,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "WomanYing"),
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
						modelId = "Model_Master_LieSha",
						id = "Master",
						rotationX = 0,
						scale = 1,
						zorder = 145,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jingtou"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhedang"),
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
			actor = __getnode__(_root, "zhongbai"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 5
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
			actor = __getnode__(_root, "zhongbai")
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_bankai"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_bankai"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_weikai"),
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
					duration = 0.8
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_bankai"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_bankai"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_weikai"),
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
					duration = 0.8
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "yan_bankai"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_juyuan_mohu"),
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_1"
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
				action = "play",
				actor = __getnode__(_root, "Mus_rensheng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ManYing"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
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
				actor = __getnode__(_root, "WomanYing"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -375,
							refpt = {
								x = 0.95,
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ManYing"),
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
						name = "Lover08_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ManYing"
						},
						content = {
							"eventstory_Lover_03a_2"
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
				action = "fadeIn",
				actor = __getnode__(_root, "WomanYing"),
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
						name = "Lover08_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"WomanYing"
						},
						content = {
							"eventstory_Lover_03a_3"
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
				action = "fadeIn",
				actor = __getnode__(_root, "BoyYing"),
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
						name = "Lover08_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BoyYing"
						},
						content = {
							"eventstory_Lover_03a_4"
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
				action = "fadeOut",
				actor = __getnode__(_root, "BoyYing"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "WomanYing"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ManYing"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "cg_changmws"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "cg_changaflya"),
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
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_jingtou"),
				args = function (_ctx)
					return {
						scale = 3,
						duration = 1.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_jingtou"),
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "mwsi"),
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
				actor = __getnode__(_root, "cg_changaflya"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "cg_changmws"),
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
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mwsi"
						},
						content = {
							"eventstory_Lover_03a_5"
						},
						durations = {
							0.05
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
			actor = __getnode__(_root, "mwsi"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "bg_juyuan"),
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
			action = "stop",
			actor = __getnode__(_root, "Mus_rensheng")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "mying_gesheng"),
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					zorder = 4
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mwsi"
					},
					content = {
						"eventstory_Lover_03a_6"
					},
					durations = {
						0.05
					}
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mwsi"
					},
					content = {
						"eventstory_Lover_03a_7"
					},
					durations = {
						0.05
					}
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mwsi"
					},
					content = {
						"eventstory_Lover_03a_8"
					},
					durations = {
						0.05
					}
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
			sequential({
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "cg_changmws"),
					args = function (_ctx)
						return {
							duration = 0.25
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "cg_changaflya"),
					args = function (_ctx)
						return {
							duration = 0.25
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "cg_changmws"),
					args = function (_ctx)
						return {
							zorder = 7
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "cg_changmws"),
					args = function (_ctx)
						return {
							duration = 0.25
						}
					end
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mwsi"
						},
						content = {
							"eventstory_Lover_03a_9"
						},
						durations = {
							0.05
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mwsi"
					},
					content = {
						"eventstory_Lover_03a_10"
					},
					durations = {
						0.05
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "cg_changaflya"),
			args = function (_ctx)
				return {
					zorder = 6
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_changaflya"),
			args = function (_ctx)
				return {
					duration = 0
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
			sequential({
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "cg_changmws"),
					args = function (_ctx)
						return {
							duration = 0.25
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "cg_changaflya"),
					args = function (_ctx)
						return {
							duration = 0.25
						}
					end
				}),
				act({
					action = "updateNode",
					actor = __getnode__(_root, "cg_changmws"),
					args = function (_ctx)
						return {
							zorder = 5
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "cg_changmws"),
					args = function (_ctx)
						return {
							duration = 0.25
						}
					end
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mwsi"
						},
						content = {
							"eventstory_Lover_03a_11"
						},
						durations = {
							0.05
						}
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					duration = 0
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
					name = "Lover08_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mwsi"
					},
					content = {
						"eventstory_Lover_03a_12"
					},
					durations = {
						0.05
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "cg_changmws"),
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
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Master"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -420,
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
			actor = __getnode__(_root, "aflya"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -466,
						refpt = {
							x = 0.6,
							y = 0
						}
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
						name = "Lover08_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Lover08_dialog_speak_name_4"
						},
						content = {
							"eventstory_Lover_03a_14"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "aflya"),
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "aflya_ren"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "aflya"),
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
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya_ren"
						},
						content = {
							"eventstory_Lover_03a_16"
						},
						durations = {
							0.05
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "aflya_ren"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
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
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_Lover_03a_17"
						},
						storyLove = {}
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "mwsi"),
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
			actor = __getnode__(_root, "bg_juyuan_po_mohu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "aflya"),
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Lover08_dialog_speak_name_4"
						},
						content = {
							"eventstory_Lover_03a_19"
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
				action = "fadeOut",
				actor = __getnode__(_root, "bg_zhedang"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_rensheng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_20"
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
				actor = __getnode__(_root, "cg_juyuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "mying_gesheng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "cg_juyuan"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.2
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Lover08_dialog_speak_name_4"
						},
						content = {
							"eventstory_Lover_03a_21"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "cg_juyuan"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 1
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_22"
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
					name = "Lover08_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_03a_23"
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
			action = "fadeOut",
			actor = __getnode__(_root, "cg_juyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhedang"),
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
		concurrent({
			rockScreen({
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
						name = "Lover08_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Lover08_dialog_speak_name_4"
						},
						content = {
							"eventstory_Lover_03a_24"
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
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.3
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "mwsi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 200,
						refpt = {
							x = 0.4,
							y = 0
						}
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
				actor = __getnode__(_root, "mying_jiaobu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "scene_main_terror_3.jpg",
						printAudioOff = true,
						center = 2,
						bgShow = true,
						content = {
							"eventstory_Lover_03a_25"
						},
						durations = {
							0.08
						},
						waitTimes = {
							1
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
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_jiaobu")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "mying_jiaobu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "scene_main_terror_3.jpg",
						printAudioOff = true,
						center = 2,
						bgShow = true,
						content = {
							"eventstory_Lover_03a_26"
						},
						durations = {
							0.08
						},
						waitTimes = {
							1
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
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_jiaobu")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "mying_jiaobu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "scene_main_terror_3.jpg",
						printAudioOff = true,
						center = 2,
						bgShow = true,
						content = {
							"eventstory_Lover_03a_27"
						},
						durations = {
							0.08
						},
						waitTimes = {
							1
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
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_jiaobu")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "mying_jiaobu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "scene_main_terror_3.jpg",
						printAudioOff = true,
						center = 2,
						bgShow = true,
						content = {
							"eventstory_Lover_03a_28"
						},
						durations = {
							0.08
						},
						waitTimes = {
							1
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
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_jiaobu")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "mying_jiaobu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "scene_main_terror_3.jpg",
						printAudioOff = true,
						center = 2,
						bgShow = true,
						content = {
							"eventstory_Lover_03a_29"
						},
						durations = {
							0.08
						},
						waitTimes = {
							1
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
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_jiaobu")
		}),
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "scene_main_terror_3.jpg",
						printAudioOff = true,
						center = 2,
						bgShow = true,
						content = {
							"eventstory_Lover_03a_30"
						},
						durations = {
							0.08
						},
						waitTimes = {
							1
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "mying_jiaobu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		act({
			action = "volume",
			actor = __getnode__(_root, "mying_jiaobu"),
			args = function (_ctx)
				return {
					volumeend = 0,
					duration = 1,
					volumebegin = 0.8,
					type = "effect"
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
			actor = __getnode__(_root, "mying_jiaobu")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "scene_main_terror_3.jpg",
					printAudioOff = true,
					center = 2,
					bgShow = true,
					content = {
						"eventstory_Lover_03a_31"
					},
					durations = {
						0.08
					},
					waitTimes = {
						1
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "volume",
			actor = __getnode__(_root, "mying_gesheng"),
			args = function (_ctx)
				return {
					volumeend = 0,
					duration = 4,
					volumebegin = 0.8,
					type = "music"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 4
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_gesheng")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xiasiwole"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			rockScreen({
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiasiwole"),
				args = function (_ctx)
					return {
						duration = 1.5,
						position = {
							x = 0,
							y = -500,
							refpt = {
								x = 0.5,
								y = -0.4
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xiasiwole_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mwsi/face_mwsi_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xiasiwole"
						},
						content = {
							"eventstory_Lover_03a_32"
						},
						durations = {
							0.3
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "mying_gesheng"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			})
		}),
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_Lover_03a_33"
						},
						storyLove = {}
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "mying_gesheng")
		})
	})
end

local function eventstory_Lover_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Lover_03a",
					scene = scene_eventstory_Lover_03a
				}
			end
		})
	})
end

stories.eventstory_Lover_03a = eventstory_Lover_03a

return _M
