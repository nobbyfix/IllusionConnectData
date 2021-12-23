local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_drama_00a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_drama_00a = {
	actions = {}
}
scenes.scene_eventstory_drama_00a = scene_eventstory_drama_00a

function scene_eventstory_drama_00a:stage(args)
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
						name = "bg_guangchangY",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_drama_2.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "bg_guangchangY",
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
				id = "Mus_zhutiyinyue",
				fileName = "Mus_Story_Drama_Main",
				type = "Music"
			},
			{
				id = "Mus_chuyu",
				fileName = "Mus_Story_Drama_Farewell",
				type = "Music"
			},
			{
				id = "yin_zhangsheng",
				fileName = "Se_Story_Drama_applause",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_drama_00a.actions.start_eventstory_drama_00a(_root, args)
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_CKFSJi",
						id = "mke",
						rotationX = 0,
						scale = 0.5,
						zorder = 120,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "mke_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "mke/face_mke_7.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "mke_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -27,
									y = 1589
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_chuyu"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "volume",
			actor = __getnode__(_root, "Mus_chuyu"),
			args = function (_ctx)
				return {
					volumeend = 1,
					duration = 4,
					volumebegin = 0,
					type = "music"
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SSBYa",
						id = "kptwei",
						rotationX = 0,
						scale = 0.5,
						zorder = 150,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0.6,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "kptwei_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kptwei/face_kptwei_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "kptwei_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -193,
									y = 1385
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_guangchangY"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -220,
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
				actor = __getnode__(_root, "kptwei"),
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
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_4.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 8
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 6
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "IrisL_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"IrisL_dialog_speak_name_1"
					},
					content = {
						"eventstory_drama_00a_1"
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
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0.19,
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
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_2"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_3"
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
				action = "moveTo",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.78,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mke"),
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
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_00a_4"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_5"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_00a_6"
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
					name = "IrisL_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"kptwei"
					},
					content = {
						"eventstory_drama_00a_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0.22,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.76,
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
						name = "IrisL_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei",
							"mke"
						},
						content = {
							"eventstory_drama_00a_8"
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_9"
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
					name = "IrisL_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mke"
					},
					content = {
						"eventstory_drama_00a_10"
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
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0.39,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kptwei"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "kptwei"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -220,
						refpt = {
							x = 0.32,
							y = 0
						}
					}
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_11"
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
				action = "changeTexture",
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_00a_12"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kptwei"),
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
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -220,
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -220,
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
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_13"
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
					name = "IrisL_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mke"
					},
					content = {
						"eventstory_drama_00a_14"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_00a_15"
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
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_chuyu")
		})
	})
end

local function eventstory_drama_00a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_drama_00a",
					scene = scene_eventstory_drama_00a
				}
			end
		})
	})
end

stories.eventstory_drama_00a = eventstory_drama_00a

return _M
