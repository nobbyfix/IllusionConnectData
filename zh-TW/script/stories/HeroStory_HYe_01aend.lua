local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HeroStory_HYe_01aend")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HeroStory_HYe_01aend = {
	actions = {}
}
scenes.scene_HeroStory_HYe_01aend = scene_HeroStory_HYe_01aend

function scene_HeroStory_HYe_01aend:stage(args)
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
						image = "bg_story_EXscene_3_2.jpg",
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
								layoutMode = 1,
								type = "MovieClip",
								zorder = 3,
								visible = true,
								id = "bgEx_jingyubeishangxin",
								scale = 1,
								actionName = "all_jingyubeishangxin",
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
					}
				}
			},
			{
				id = "flashMask",
				type = "FlashMask"
			},
			{
				id = "mask",
				type = "Mask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_HeroStory_HYe_01aend.actions.start_HeroStory_HYe_01aend(_root, args)
	return sequential({
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
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_jingyubeishangxin"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>這…這是怎麼回事！？</outline></font>"
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_ZTXChang",
					id = "ZTXChang_speak",
					rotationX = 0,
					scale = 1.08,
					zorder = 4,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.6,
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
								x = -50.8,
								y = 789
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
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
					name = "村咲小夜",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>嘖！雖然不強，但夢魘數量這麼多很麻煩啊！</font>"
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
					name = "村咲小夜",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>感覺像是被驅趕，或被驚嚇到一樣！</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ZTXChang_speak"),
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
					modelId = "Model_HYe",
					id = "HYe_speak",
					rotationX = 0,
					scale = 1,
					zorder = 10,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "HYe_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "HYe/HYe_face_3.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "HYe_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 7.5,
								y = 653.3
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "HYe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "HYe_speak"),
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>之前的戰鬥，明明沒有這麼多魔神仔…夢魘的啊！</font>"
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我有不好的預感…可惡！</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 1,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HYe_speak"),
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>打倒了眼前的夢魘之後，石琥趁著夢魘間的空隙往前迅速奔去。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_9.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ZTXChang_speak"),
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
					name = "村咲小夜",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>石琥！等等這樣突進很危險！</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_10.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "村咲小夜",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>嘖，這種衝動的個性怎麼跟某個電玩笨蛋很像啊！</font>"
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>別碎念啦！快跟上石琥！</outline></font>"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>石琥腦中閃過一對大小石虎，對著另一支被捕獸鋏夾住的小石虎哀鳴的畫面。</font>"
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
					name = "石琥",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>對不起……你們……絕對要活下來！</font>"
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 1.5,
							y = 0
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
					duration = 0.3
				}
			end
		})
	})
end

local function HeroStory_HYe_01aend(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HeroStory_HYe_01aend",
					scene = scene_HeroStory_HYe_01aend
				}
			end
		})
	})
end

stories.HeroStory_HYe_01aend = HeroStory_HYe_01aend

return _M
