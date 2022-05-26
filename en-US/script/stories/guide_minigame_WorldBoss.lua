local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_minigame_WorldBoss")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_minigame_WorldBoss = {
	actions = {}
}
scenes.scene_guide_minigame_WorldBoss = scene_guide_minigame_WorldBoss

function scene_guide_minigame_WorldBoss:stage(args)
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
				opacity = 0.75,
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
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_guide_minigame_WorldBoss.actions.action_guide_minigame_WorldBoss(_root, args)
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
					duration = 0.05
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "hm")
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_ZTXChang",
						id = "ZTXChang",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.56,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ZTXChang_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ZTXChang/ZTXChang_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ZTXChang_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -51.3,
									y = 977.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXChang"),
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
						modelId = "Model_Story_CLMan",
						id = "CLMan",
						rotationX = 0,
						scale = 0.63,
						zorder = 50,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.47,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CLMan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "CLMan/CLMan_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CLMan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 77.5,
									y = 1045.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CLMan"),
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
						modelId = "Model_Story_FTLEShi",
						id = "FTLEShi",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.54,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "FTLEShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "FTLEShi/FTLEShi_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "FTLEShi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -41.5,
									y = 1286.1
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FTLEShi"),
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
					duration = 0.4
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
			action = "moveTo",
			actor = __getnode__(_root, "ZTXChang"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -270,
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
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = 1,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 0.52,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
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
						name = "minigame_WorldBoss_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"guide_minigame_WorldBoss_1"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.7,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
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
						name = "minigame_WorldBoss_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"guide_minigame_WorldBoss_2"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
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
					name = "minigame_WorldBoss_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"guide_minigame_WorldBoss_3"
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
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
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
					name = "minigame_WorldBoss_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"guide_minigame_WorldBoss_4"
					},
					durations = {
						0.03
					}
				}
			end
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
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
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
		})
	})
end

local function guide_minigame_WorldBoss(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_minigame_WorldBoss",
					scene = scene_guide_minigame_WorldBoss
				}
			end
		})
	})
end

stories.guide_minigame_WorldBoss = guide_minigame_WorldBoss

return _M
