local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_VanGogh_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_VanGogh_01a = {
	actions = {}
}
scenes.scene_eventstory_VanGogh_01a = scene_eventstory_VanGogh_01a

function scene_eventstory_VanGogh_01a:stage(args)
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
						name = "bg",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_21gletter_1.jpg",
						layoutMode = 1,
						zorder = 4,
						id = "bg",
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
				id = "Mus_zaijia",
				fileName = "Mus_Story_After_Battle",
				type = "Music"
			},
			{
				id = "yin_qiaomen",
				fileName = "Se_Story_Knock",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_beida",
				scale = 1.05,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.45,
						y = 0.5
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_VanGogh_01a.actions.start_eventstory_VanGogh_01a(_root, args)
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
						"eventstory_VanGogh_01a_1",
						"eventstory_VanGogh_01a_2",
						"eventstory_VanGogh_01a_3",
						"eventstory_VanGogh_01a_4"
					},
					durations = {
						0.07,
						0.07,
						0.07,
						0.1
					},
					waitTimes = {
						0.8,
						0.8,
						0.8,
						1
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
						"eventstory_VanGogh_01a_5"
					},
					durations = {
						0.15
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
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zaijia"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
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
					duration = 0.6
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_FGao_noshield",
						id = "DMSe",
						rotationX = 0,
						scale = 0.78,
						zorder = 10,
						position = {
							x = 0,
							y = -470,
							refpt = {
								x = 0.46,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "DMSe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "dmse/face_dmse_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "DMSe_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 46.5,
									y = 1241.8
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DMSe"),
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
				actor = __getnode__(_root, "DMSe"),
				args = function (_ctx)
					return {
						duration = 0.2
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
						modelId = "Model_NCai",
						id = "LDWXi",
						rotationX = 0,
						scale = 0.67,
						zorder = 15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.3,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "LDWXi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ldwxi/face_ldwxi_10.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "LDWXi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -103.5,
									y = 1033.4
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LDWXi"),
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
						modelId = "Model_YMHTPu",
						id = "YMHTPu",
						rotationX = 0,
						scale = 1,
						zorder = 16,
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
								name = "YMHTPu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "YMHTPu/YMHTPu_face_8.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "YMHTPu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -1.5,
									y = 754.3
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_qiaomen")
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
			actor = __getnode__(_root, "yin_qiaomen")
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
			actor = __getnode__(_root, "yin_qiaomen")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_6"
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
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YMHTPu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "DMSe"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -470,
							refpt = {
								x = 0.13,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.56,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.82,
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
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_7"
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
				action = "changeTexture",
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_4.png",
						pathType = "STORY_FACE"
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
			action = "changeTexture",
			actor = __getnode__(_root, "LDWXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ldwxi/face_ldwxi_7.png",
					pathType = "STORY_FACE"
				}
			end
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
				action = "updateNode",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						zorder = 20
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_8"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DMSe"),
				args = function (_ctx)
					return {
						zorder = 19
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_9"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "DMSe"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -470,
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
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "DMSe"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -470,
								refpt = {
									x = 0.23,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.72,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_10"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_11"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_12"
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
					action = "moveTo",
					actor = __getnode__(_root, "LDWXi"),
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
					action = "updateNode",
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							zorder = 30
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.56,
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
					actor = __getnode__(_root, "DMSe"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -470,
								refpt = {
									x = 0.13,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.82,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_13"
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
				action = "updateNode",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						zorder = 40
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DMSe"),
				args = function (_ctx)
					return {
						zorder = 35
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_14"
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
					actor = __getnode__(_root, "LDWXi"),
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
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.42,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_15"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_16"
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
					actor = __getnode__(_root, "LDWXi"),
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
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.56,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_17"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_18"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_01a_19"
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
					name = "VanGogh_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DMSe"
					},
					content = {
						"eventstory_VanGogh_01a_20"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_21"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_22"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_23"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_24"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_25"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_26"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			sequential({
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "LDWXi"),
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
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.42,
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_27"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_28"
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
					name = "VanGogh_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu"
					},
					content = {
						"eventstory_VanGogh_01a_29"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_30"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_31"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_32"
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
					name = "VanGogh_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DMSe"
					},
					content = {
						"eventstory_VanGogh_01a_33"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_01a_34"
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
					action = "moveTo",
					actor = __getnode__(_root, "DMSe"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -470,
								refpt = {
									x = 0.23,
									y = -0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "DMSe"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -470,
								refpt = {
									x = 0.13,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_beida"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 1.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.42,
									y = -1.4
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_35"
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
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_36"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_37"
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
					name = "VanGogh_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu"
					},
					content = {
						"eventstory_VanGogh_01a_38"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_39"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_01a_40"
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
				actor = __getnode__(_root, "DMSe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dmse/face_dmse_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DMSe"
						},
						content = {
							"eventstory_VanGogh_01a_41"
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
			action = "fadeOut",
			actor = __getnode__(_root, "DMSe"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YMHTPu"),
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
					bgImage = "bg_story_cg_21gletter_4.jpg",
					printAudioOff = true,
					bgShow = true,
					center = 2,
					content = {
						"eventstory_VanGogh_01a_42",
						"eventstory_VanGogh_01a_43",
						"eventstory_VanGogh_01a_44",
						"eventstory_VanGogh_01a_45"
					},
					durations = {
						0.08,
						0.08,
						0.08,
						0.08
					},
					waitTimes = {
						0.9,
						0.9,
						0.9,
						2
					}
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
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_zaijia")
		})
	})
end

local function eventstory_VanGogh_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_VanGogh_01a",
					scene = scene_eventstory_VanGogh_01a
				}
			end
		})
	})
end

stories.eventstory_VanGogh_01a = eventstory_VanGogh_01a

return _M
