local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_sayounara_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_sayounara_01a = {
	actions = {}
}
scenes.scene_eventstory_sayounara_01a = scene_eventstory_sayounara_01a

function scene_eventstory_sayounara_01a:stage(args)
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
						name = "bg_di",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 7,
						id = "bg_di",
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
						name = "bg_shiji",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_7_4.jpg",
						layoutMode = 1,
						zorder = 6,
						id = "bg_shiji",
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
						name = "bg_zhanzheng",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_fireworks_1.jpg",
						layoutMode = 1,
						zorder = 13,
						id = "bg_zhanzheng",
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
						name = "bg_xiuzheng",
						pathType = "SCENE",
						type = "Image",
						image = "gallery_album_01.jpg",
						layoutMode = 1,
						zorder = 12,
						id = "bg_xiuzheng",
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
				id = "Mus_shiji",
				fileName = "Mus_Story_Dongwenhui",
				type = "Music"
			},
			{
				id = "yin_lingyi",
				fileName = "Se_Story_Disappear",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_tixing",
				scale = 0.7,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.78,
						y = 0.4
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_sayounara_01a.actions.start_eventstory_sayounara_01a(_root, args)
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_sayounara_01a_1",
						"eventstory_sayounara_01a_2",
						"eventstory_sayounara_01a_3"
					},
					durations = {
						0.07,
						0.07,
						0.07
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_sayounara_01a_4",
						"eventstory_sayounara_01a_5",
						"eventstory_sayounara_01a_6"
					},
					durations = {
						0.07,
						0.07,
						0.07
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_sayounara_01a_7",
						"eventstory_sayounara_01a_8"
					},
					durations = {
						0.07,
						0.12
					},
					waitTimes = {
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
			actor = __getnode__(_root, "bg_shiji")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_di"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_xiuzheng"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhanzheng"),
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
			actor = __getnode__(_root, "bg_zhanzheng"),
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
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "printerEffect"),
				args = function (_ctx)
					return {
						bgImage = "gallery_album_01.jpg",
						printAudioOff = true,
						center = 1,
						bgShow = true,
						content = {
							"eventstory_sayounara_01a_9",
							"eventstory_sayounara_01a_10"
						},
						durations = {
							0.07,
							0.07
						},
						waitTimes = {
							1,
							1.2
						}
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
			actor = __getnode__(_root, "bg_xiuzheng"),
			args = function (_ctx)
				return {
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
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_shiji"),
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
						modelId = "Model_SP_WTXXuan_stand",
						id = "sp_mcqdai",
						rotationX = 0,
						scale = 0.65,
						zorder = 135,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 1.02,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_mcqdai_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/mcqdai_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_mcqdai_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -55,
									y = 845
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_mcqdai"),
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
						modelId = "Model_MYan_2",
						id = "CB_Yuan",
						rotationX = 0,
						scale = 0.6,
						zorder = 136,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Yuan_Arm1",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Yuan_Arm1",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							},
							{
								resType = 0,
								name = "CB_Yuan_Arm2",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Yuan_Arm2",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							},
							{
								resType = 0,
								name = "CB_Yuan_Arm3",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Yuan_Arm3",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan"),
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
						modelId = "Model_MYan_4",
						id = "CB_Dai",
						rotationX = 0,
						scale = 0.6,
						zorder = 135,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 1.25,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Dai_Arm1",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Dai_Arm1",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 2.5,
									y = 358
								}
							},
							{
								resType = 0,
								name = "CB_Dai_Arm2",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Dai_Arm2",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 2.5,
									y = 358
								}
							},
							{
								resType = 0,
								name = "CB_Dai_Arm3",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Dai_Arm3",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 2.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai"),
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
						modelId = "Model_MYan_1",
						id = "CB_Xiong",
						rotationX = 0,
						scale = 0.65,
						zorder = 135,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Xiong_Arm1",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Xiong_Arm1",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							},
							{
								resType = 0,
								name = "CB_Xiong_Arm2",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Xiong_Arm2",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							},
							{
								resType = 0,
								name = "CB_Xiong_Arm3",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Xiong_Arm3",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong"),
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
						modelId = "Model_MYan_3",
						id = "CB_Mu",
						rotationX = 0,
						scale = 0.6,
						zorder = 135,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Mu_Arm1",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Mu_Arm1",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -0.5,
									y = 359
								}
							},
							{
								resType = 0,
								name = "CB_Mu_Arm2",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Mu_Arm2",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -0.5,
									y = 359
								}
							},
							{
								resType = 0,
								name = "CB_Mu_Arm3",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = false,
								id = "CB_Mu_Arm3",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -0.5,
									y = 359
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu"),
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
						modelId = "Model_SP_SSQXin_single",
						id = "sp_xmlhui",
						rotationX = 0,
						scale = 0.65,
						zorder = 140,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_xmlhui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_xmlhui/face_sp_xmlhui_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_xmlhui_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -119.5,
									y = 1236
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Xiong_Arm3"),
			args = function (_ctx)
				return {
					visible = true
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Xiong_Arm1"),
			args = function (_ctx)
				return {
					visible = false
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
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.8,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "bg_di"),
					args = function (_ctx)
						return {
							duration = 0.8,
							position = {
								refpt = {
									x = -0.5,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "bg_di"),
					args = function (_ctx)
						return {
							duration = 1.6
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.3,
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
					duration = 0.6
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm2"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						visible = false
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm2"),
				args = function (_ctx)
					return {
						visible = false
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm2"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						visible = false
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
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -15,
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
				actor = __getnode__(_root, "CB_Xiong"),
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
				actor = __getnode__(_root, "CB_Xiong_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						visible = true
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.15,
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm3"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.15,
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm3"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
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
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.72,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_11"
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm3"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.15,
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
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "CB_Xiong"),
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
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = -0.1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.52,
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
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_12"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.48,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_13"
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.15
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm2"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						visible = true
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm3"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						visible = false
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
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm2"),
				args = function (_ctx)
					return {
						visible = true
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
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
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
			action = "orbitCamera",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
			action = "orbitCamera",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -15,
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.27,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
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
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.82,
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_01a_14"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.23,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_15"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.27,
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
					duration = 0.8
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_16"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_01a_17"
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
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing7",
						id = "LaoBan",
						rotationX = 0,
						scale = 0.9,
						zorder = 100,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "LaoBan"),
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
				actor = __getnode__(_root, "LaoBan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LaoBan"),
				args = function (_ctx)
					return {
						duration = 0.35,
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
					duration = 0.35
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_mcqdai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/mcqdai_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "sp_mcqdai"),
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -160,
						refpt = {
							x = 0.23,
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
					name = "Sayounara_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LaoBan"
					},
					content = {
						"eventstory_sayounara_01a_18"
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
			actor = __getnode__(_root, "LaoBan"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_01a_19"
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
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
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
			actor = __getnode__(_root, "LaoBan"),
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
					name = "Sayounara_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LaoBan"
					},
					content = {
						"eventstory_sayounara_01a_20"
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
			actor = __getnode__(_root, "LaoBan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_21"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			sequential({
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "sp_mcqdai"),
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
					actor = __getnode__(_root, "sp_mcqdai"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -160,
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
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_22"
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
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -160,
						refpt = {
							x = 0.52,
							y = 0
						}
					}
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
						"eventstory_sayounara_01a_23"
					},
					durations = {
						0.07
					},
					waitTimes = {
						1
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
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
			action = "changeTexture",
			actor = __getnode__(_root, "sp_mcqdai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/mcqdai_face_2.png",
					pathType = "STORY_FACE"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_01a_24"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_25"
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
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						zorder = 120
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						zorder = 130
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.22,
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_01a_26"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_7.png",
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
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.77,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Sayounara_dialog_speak_name_7"
						},
						content = {
							"eventstory_sayounara_01a_27"
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
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
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_xmlhui"),
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
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.18,
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
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "sp_mcqdai"),
					args = function (_ctx)
						return {
							duration = 0.05,
							position = {
								x = 0,
								y = -160,
								refpt = {
									x = 0.775,
									y = 0.005
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "sp_mcqdai"),
					args = function (_ctx)
						return {
							duration = 0.05,
							position = {
								x = 0,
								y = -160,
								refpt = {
									x = 0.77,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_28"
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_sayounara_01a_29"
					},
					durations = {
						0.07
					},
					waitTimes = {
						0.7
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -160,
						refpt = {
							x = 0.52,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_xmlhui"),
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_01a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm2"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm2"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai_Arm1"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai_Arm2"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan_Arm1"),
				args = function (_ctx)
					return {
						visible = true
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan_Arm2"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan_Arm3"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
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
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						zorder = 100
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_01a_31"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_32"
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
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.3,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "fadeOut",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.4
							}
						end
					})
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 1,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "opacityTo",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					valend = 50,
					duration = 0.1
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
				actor = __getnode__(_root, "yin_lingyi"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.8,
									y = 0.07
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.6,
									y = 0.07
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.4,
									y = 0.07
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
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
					duration = 0.9
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "CB_Xiong_Arm1"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.3,
									y = -0.05
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
						name = "Sayounara_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Sayounara_dialog_speak_name_7"
						},
						content = {
							"eventstory_sayounara_01a_33"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_lingyi")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -160,
						refpt = {
							x = 0.27,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "sp_xmlhui"),
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
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -340,
						refpt = {
							x = 0.82,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_xmlhui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_xmlhui/face_sp_xmlhui_4.png",
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
			actor = __getnode__(_root, "CB_Xiong"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_01a_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.23,
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
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_35"
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
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
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
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LaoBan"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LaoBan"
					},
					content = {
						"eventstory_sayounara_01a_36"
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
					name = "Sayounara_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LaoBan"
					},
					content = {
						"eventstory_sayounara_01a_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_xmlhui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_xmlhui/face_sp_xmlhui_6.png",
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
			actor = __getnode__(_root, "LaoBan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.6,
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_01a_38"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_39"
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
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			sequential({
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "sp_mcqdai"),
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
					actor = __getnode__(_root, "sp_mcqdai"),
					args = function (_ctx)
						return {
							duration = 0.05,
							position = {
								x = 0,
								y = -160,
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
					actor = __getnode__(_root, "sp_mcqdai"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -160,
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
				action = "opacityTo",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.36,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.64,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
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
				actor = __getnode__(_root, "CB_Xiong_Arm1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Mu_Arm1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						zorder = 100
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						zorder = 105
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						zorder = 110
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						zorder = 120
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_01a_40"
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
						freq = 6,
						strength = 2
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CB_Xiong",
							"CB_Mu",
							"CB_Yuan"
						},
						content = {
							"eventstory_sayounara_01a_41"
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
						freq = 6,
						strength = 2
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
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
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_tixing"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.64,
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
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_tixing")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "CB_Dai"),
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
			action = "moveTo",
			actor = __getnode__(_root, "LaoBan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
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
			actor = __getnode__(_root, "LaoBan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LaoBan"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LaoBan"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LaoBan"
						},
						content = {
							"eventstory_sayounara_01a_42"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.65,
								y = 0
							}
						}
					}
				end
			})
		}),
		sequential({
			concurrent({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "opacityTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							valend = 95,
							duration = 0.1
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.58,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.65,
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
					actor = __getnode__(_root, "CB_Xiong"),
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
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.8,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 1.25,
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
						duration = 1.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
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
						name = "Sayounara_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LaoBan"
						},
						content = {
							"eventstory_sayounara_01a_43"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -160,
						refpt = {
							x = 0.28,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "sp_mcqdai"),
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
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -340,
						refpt = {
							x = 0.77,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_mcqdai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/mcqdai_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_xmlhui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_xmlhui/face_sp_xmlhui_1.png",
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
			actor = __getnode__(_root, "LaoBan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_01a_44"
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
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 1.1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 1
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
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_xmlhui"),
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
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.63,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_xmlhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_xmlhui/face_sp_xmlhui_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_01a_45"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 0.75,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CB_Mu_Arm1"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CB_Dai_Arm1"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
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
				action = "moveTo",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 1.1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "CB_Mu"),
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
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 1.25,
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
			action = "fadeOut",
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "CB_Yuan"),
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
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 1.25,
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
			action = "moveTo",
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 0.5,
							y = 0
						}
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
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "CB_Yuan_Arm1"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "CB_Yuan_Arm2"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "CB_Yuan_Arm3"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Yuan"),
						args = function (_ctx)
							return {
								duration = 0.4,
								position = {
									x = 0,
									y = -15,
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
						actor = __getnode__(_root, "CB_Dai"),
						args = function (_ctx)
							return {
								duration = 0.4,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 1.2,
										y = 0
									}
								}
							}
						end
					})
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
			action = "stop",
			actor = __getnode__(_root, "Mus_shiji")
		})
	})
end

local function eventstory_sayounara_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_sayounara_01a",
					scene = scene_eventstory_sayounara_01a
				}
			end
		})
	})
end

stories.eventstory_sayounara_01a = eventstory_sayounara_01a

return _M
