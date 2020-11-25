local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HeroStory_ZZBBWei_05a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HeroStory_ZZBBWei_05a = {
	actions = {}
}
scenes.scene_HeroStory_ZZBBWei_05a = scene_HeroStory_ZZBBWei_05a

function scene_HeroStory_ZZBBWei_05a:stage(args)
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
				image = "bg_story_EXscene_6_1.jpg",
				layoutMode = 1,
				id = "bg",
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
						id = "bgEX_businiaoyanhui",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "anim_businiaoyanhui",
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
				id = "HeroStory_music",
				fileName = "Mus_Story_Dongwenhui",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_HeroStory_ZZBBWei_05a.actions.start_HeroStory_ZZBBWei_05a(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_businiaoyanhui"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "autoPlayButton")
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
			actor = __getnode__(_root, "HeroStory_music"),
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
					modelId = "Model_Story_SGHQShou02",
					id = "SGHQShou2_speak",
					rotationX = 0,
					scale = 1.3,
					zorder = 12,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou02_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou02_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou02_face",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 33.6,
								y = 674.8
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou2_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou2_speak"),
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SGHQShou2_speak"),
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
					modelId = "Model_TPGZhu",
					id = "TPGZhu_speak",
					rotationX = 0,
					scale = 0.925,
					zorder = 11,
					position = {
						x = 0,
						y = -140,
						refpt = {
							x = 0.725,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "TPGZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "TPGZhu/TPGZhu_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "TPGZhu_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 10.4,
								y = 581
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "TPGZhu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "TPGZhu_speak"),
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
					name = "dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "TPGZhu_speak"),
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
					modelId = "Model_ZZBBWei",
					id = "ZZBBWei_speak",
					rotationX = 0,
					scale = 1,
					zorder = 13,
					position = {
						x = 0,
						y = -130,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ZZBBWei_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZZBBWei/ZZBBWei_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ZZBBWei_face",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -19.9,
								y = 601
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZZBBWei_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZZBBWei_speak"),
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
					name = "dialog_speak_name_27",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZZBBWei_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ZZBBWei_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -130,
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
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou2_speak"),
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_4"
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
					name = "dialog_speak_name_27",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZZBBWei_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_5"
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
					name = "dialog_speak_name_27",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZZBBWei_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_6"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_7"
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
					name = "dialog_speak_name_27",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZZBBWei_speak"
					},
					content = {
						"HeroStory_ZZBBWei_05a_8"
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

local function HeroStory_ZZBBWei_05a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HeroStory_ZZBBWei_05a",
					scene = scene_HeroStory_ZZBBWei_05a
				}
			end
		})
	})
end

stories.HeroStory_ZZBBWei_05a = HeroStory_ZZBBWei_05a

return _M
