local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HeroStory_BBLMa_01aend")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HeroStory_BBLMa_01aend = {
	actions = {}
}
scenes.scene_HeroStory_BBLMa_01aend = scene_HeroStory_BBLMa_01aend

function scene_HeroStory_BBLMa_01aend:stage(args)
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
				name = "bg",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_EXscene_5_1.jpg",
				layoutMode = 1,
				zorder = 1,
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
				},
				children = {
					{
						id = "bgEX_bennengsiqihuoqian",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "all_bennengsiqihuoqian",
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
				id = "date_music",
				fileName = "Mus_Story_Dongwenhui",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_HeroStory_BBLMa_01aend.actions.start_HeroStory_BBLMa_01aend(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_bennengsiqihuoqian"),
			args = function (_ctx)
				return {
					time = -1
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "date_music"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_BBLMa",
					id = "BBLMa_speak",
					rotationX = 0,
					scale = 1.155,
					zorder = 10,
					position = {
						x = 0,
						y = -450,
						refpt = {
							x = 0.45,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "BBLMa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "BBLMa/BBLMa_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "BBLMa_face",
							scale = 1.025,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 90.3,
								y = 779.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_1"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_2"
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
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_CSZhe",
					id = "Enemy_CSZhe",
					rotationX = 0,
					scale = 1,
					zorder = 11,
					position = {
						x = 0,
						y = -459,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Enemy_CSZhe"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CSZhe"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_30",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Enemy_CSZhe"
					},
					content = {
						"HeroStory_BBLMa_01aend_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Enemy_CSZhe"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 1.3,
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
					modelId = "Model_CZheng",
					id = "CZheng_speak",
					rotationX = 0,
					scale = 1.2,
					zorder = 13,
					position = {
						x = 0,
						y = -445,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_4"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CZheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -445,
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
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -450,
						refpt = {
							x = 0.3,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_6"
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
			actor = __getnode__(_root, "CZheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -450,
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_7"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CZheng_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -445,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "CZheng_speak"),
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_10"
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"HeroStory_BBLMa_01aend_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		})
	})
end

local function HeroStory_BBLMa_01aend(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HeroStory_BBLMa_01aend",
					scene = scene_HeroStory_BBLMa_01aend
				}
			end
		})
	})
end

stories.HeroStory_BBLMa_01aend = HeroStory_BBLMa_01aend

return _M
