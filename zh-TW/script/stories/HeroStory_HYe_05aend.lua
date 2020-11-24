local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HeroStory_HYe_05aend")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HeroStory_HYe_05aend = {
	actions = {}
}
scenes.scene_HeroStory_HYe_05aend = scene_HeroStory_HYe_05aend

function scene_HeroStory_HYe_05aend:stage(args)
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
					},
					{
						resType = 0,
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_1_7.jpg",
						layoutMode = 1,
						zorder = 2,
						id = "bg1",
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
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 255,
				videoName = "stroy_chuxian",
				id = "stroy_chuxian",
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 50,
				visible = false,
				id = "beiji_juqingtexiao",
				scale = 1.05,
				actionName = "beiji_juqingtexiao",
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
				id = "Se_Story_Nightmare_Single_Big",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "Se_Story_Disappear_2",
				fileName = "Se_Story_Disappear_2",
				type = "Sound"
			},
			{
				id = "HeroStory_music",
				fileName = "Mus_Story_Home",
				type = "Music"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 30,
				displayType = "ui",
				visible = false,
				id = "panB",
				scale = 1.05,
				actionName = "zhuanchangb_juqingtexiao",
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
			},
			{
				id = "mask",
				type = "Mask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_HeroStory_HYe_05aend.actions.start_HeroStory_HYe_05aend(_root, args)
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
			action = "play",
			actor = __getnode__(_root, "HeroStory_music"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "stroy_chuxian"),
			args = function (_ctx)
				return {
					time = -1
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>夢魘之主在圍攻之下逐漸失去了體力，眼見屈居下風，在一聲嘶吼後朝著眾人釋放出強力的衝擊波，打算突破包圍。</font>"
					},
					durations = {
						0.03
					}
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
					zorder = 10,
					position = {
						x = 0,
						y = -140,
						refpt = {
							x = 0.525,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "TPGZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "TPGZhu/TPGZhu_face_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = -1,
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>哼，不能用鳳凰火焰本來不想出手的……浮生三千，卷護吾身！</font>"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0.2,
								alpha = 1,
								duration = 0.5,
								fadein = 0.3
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>眾人身邊浮現了如書卷一般的靈力屏障，擋下了夢魘之主強力的一擊。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>小夜，我們上！ 封住他的行動！</outline></font>"
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
							image = "ZTXChang/ZTXChang_face_3.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>好！看我的……第六天魔王！！</font>"
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
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.6,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						scale = 1.18,
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						scale = 1.08,
						duration = 0.15
					}
				end
			})
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
		concurrent({
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0.2,
								alpha = 1,
								duration = 0.5,
								fadein = 0.3
							}
						}
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Nightmare_Single_Big")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.5,
							y = 0.48
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.5,
							y = 0.5
						}
					}
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 2
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>夢魘之主在淩厲的攻勢之下只能硬撐不倒下……</font>"
					},
					durations = {
						0.03
					}
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
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_1.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>石琥！</font>"
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
					zorder = 11,
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
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "HYe_speak"),
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>石虎、大家……對不起……</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我會讓這片山林變成大家可以共同生活的環境，請你們再等一下……</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>猛虎亂舞！</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>但是，還有很多該做的事情，我不能在這裡輸給你們！</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>喝啊～～！！！！</font>"
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
		concurrent({
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 1,
								alpha = 1,
								duration = 0.1,
								fadein = 0.1
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>噙著淚水，石琥的一擊擊穿夢魘的軀體，在穿越夢魘之主的同時彷佛看見山林中的動物們身影一一浮現眼前。</font>"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>隨著夢魘之主被擊敗，夢境空間也隨之逐漸消散。</font>"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>在不遠處，一個有黑色斑點柔軟毛皮的生物倒在地上。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "stroy_chuxian")
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
							x = 0.5,
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
					duration = 0.1
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>這是……？另一隻小石虎！？</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "panB")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "panB")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HYe_speak"),
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
					bgShow = false,
					center = 1,
					content = {
						"<font size='24' face='${fontName_FZYH_M}' color='#cecece'><shadow color='#050b15' blurRadius='3' offsetWidth='-0.5' offsetHeight='0.5'>數日後</shadow></font>"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
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
					center = 1,
					content = {
						"<font size='24' face='${fontName_FZYH_M}' color='#cecece'><shadow color='#050b15' blurRadius='3' offsetWidth='-0.5' offsetHeight='0.5'>原開發工地</shadow></font>"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
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
					duration = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_1.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>謝謝，但……停止開發真的沒關係嗎？</font>"
					},
					durations = {
						0.03
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
			action = "fadeIn",
			actor = __getnode__(_root, "TPGZhu_speak"),
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>妳當我是誰？不死鳥財團的副總裁鳳凰月華，這個開發案的負責人。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我已經把事情跟美雪那個貓癡說了，喔……妳只要知道她是財團總裁，我鳳凰月華這一生最大的敵人就夠了。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>比起開發什麼的，目前來講這些保育這個區域生態的利益大得多了。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>有些東西一旦消失就再也無法回復，與之共伴的利潤「可能性」也會跟著消失。讓這些可能性消失，是不符財團方針的。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>不死鳥財團空閒的辦公室還多的是，新研究中心的建立讓研究所那些傢伙想辦法去調度申請使用就得了。況且……</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>（動物夢魘化可是貴重的情報，回去也跟研究所那群實驗呆子聊聊吧。）</font>"
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
			action = "fadeIn",
			actor = __getnode__(_root, "HYe_speak"),
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>但村裏的大家之前已經為了開發與否吵成一團，雖然目前這樣是暫時停止了喵……</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>不過只要開發與動物的生命一放上利益的天秤，大家遲早會再吵起來。</font>"
					},
					durations = {
						0.03
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
			action = "fadeIn",
			actor = __getnode__(_root, "TPGZhu_speak"),
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>別囉嗦了，這座山我已經跟美雪講好了。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我們會將暫時這座山置於不死鳥財團的保護之下，誰都無法動。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>妳……幫我找找……，如果有值得信賴的團體的話就把這座山信託吧。</font>"
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
			action = "fadeIn",
			actor = __getnode__(_root, "HYe_speak"),
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>喵！？妳的意思是……？</font>"
					},
					durations = {
						0.03
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
			action = "fadeIn",
			actor = __getnode__(_root, "TPGZhu_speak"),
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>哼，財團內各方理事可是完全依照利益在行動的。</font>"
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>難保哪天不會有其他短視近利的理事把腦筋動到這塊土地上，別會錯意。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "panB")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "TPGZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "panB")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg1"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_2.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>好……好可愛……我可以抱抱牠嗎？可以嗎？</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>沒想到妳對可愛的動物沒抵抗力……</outline></font>"
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
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_10.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "beiji_juqingtexiao")
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>好痛！</outline></font>"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "工作人員",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>小石虎恢復情況良好，但為了保持野性我們除了餵食外不會親近，避免太過親人而造成野放上的問題。</font>"
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
					name = "工作人員",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>雖然很可惜，但就在請外邊看吧。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>受傷的神秘動物治療好後會變成夥伴不是電玩定律嗎？</outline></font>"
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
					image = "ZTXChang/ZTXChang_face_12.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>喔～～聽起來你玩了很多遊戲嘛……</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>小、小夜，眼睛沒有在笑……</outline></font>"
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
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.6,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						scale = 1.18,
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
			action = "play",
			actor = __getnode__(_root, "panB")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "hide",
			actor = __getnode__(_root, "panB")
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
					duration = 1
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>當時奄奄一息的小石虎現在看起來卻好像沒事一樣的充滿了活力。</font>"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>一邊好奇地觀察四周，卻也一邊豎起耳朵警戒著籠外的維納斯一行人。</font>"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>當小石虎與石琥四目交接時，石虎的眼前映出了石虎媽媽與另一隻因捕獸鋏而受傷身亡的小石虎身影。</font>"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>彷彿對石琥致意一樣，牠們緩緩低下了頭，接著身影逐漸透明消失。</font>"
					},
					durations = {
						0.03
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>嗯…？</font>"
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
					duration = 0.3,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.85,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						scale = 1.08,
						duration = 0
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_5.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>咦？石琥妳怎麼了～看妳一直發愣？</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_2.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>咦…？<br/>哈哈沒事，只是牠太可愛看到出神而已。</font>"
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
					image = "ZTXChang/ZTXChang_face_8.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>就是說啊，真的不能抱牠嗎……</font>"
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
					duration = 0.1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>不行～～</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "panB")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "panB")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg1"),
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
					duration = 0
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>離開了野生動物急救站。<br/>天色已暗，維納斯陷阱行動小隊也準備要回花海市報告本次事件。</font>"
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
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_5.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>真的不跟我們來維納斯陷阱嗎？</font>"
					},
					durations = {
						0.03
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
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_1.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>謝謝妳們的好意，也許有一天石虎跟這片山林的動物都可以自在生活了。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_2.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我就會去找你們了哈哈哈。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_1.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>在這之前還有很多要做的事，明天還得幫村裏搭雞舍…</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>雞舍啊……之前跟妮娜玩遊戲時圍一圈柵欄加個門就可以了。</outline></font>"
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>再加個刷蛋裝置就有源源不絕的雞蛋了……</outline></font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>為什麼連腦子都變得跟那個電玩笨蛋一樣了啊！？</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_2.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>哈哈，能夠這麼輕鬆就好了！</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_1.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>還得要花時間跟養雞的叔叔伯伯們好好溝通。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>不要以傷害方式驅趕野生動物，一邊監測找出能兼顧產出與保育的辦法，這路說來可是非常漫長的！</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>還好趁著這次事件，也找到了一群友善農作的志工們一起來幫忙。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_2.png",
					pathType = "STORY_FACE"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>為了讓這裏的動物和人們都能過得更好，還有很多事情等著我呢！</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>等收成了再寄土產給妳們唷！</font>"
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
					image = "ZTXChang/ZTXChang_face_2.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>這樣啊……下定決心要守護某個東西不會太輕鬆的。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>到時再帶妳認識我們其他隊員。</outline></font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>如果又遇到什麼事件的話，維納斯陷阱也很樂意助妳一臂之力的！</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
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
				action = "fadeOut",
				actor = __getnode__(_root, "HYe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>漸黑的天色之下，身影漸行漸遠。四周寂靜，僅有風聲穿越山林帶來陣陣蟲鳴。</font>"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HYe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HYe/HYe_face_2.png",
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
							x = 0.5,
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>小夜、${playername}<br/>謝謝你們！</font>"
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
					duration = 3
				}
			end
		})
	})
end

local function HeroStory_HYe_05aend(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HeroStory_HYe_05aend",
					scene = scene_HeroStory_HYe_05aend
				}
			end
		})
	})
end

stories.HeroStory_HYe_05aend = HeroStory_HYe_05aend

return _M
