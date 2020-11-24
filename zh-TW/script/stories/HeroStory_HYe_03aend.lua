local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HeroStory_HYe_03aend")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HeroStory_HYe_03aend = {
	actions = {}
}
scenes.scene_HeroStory_HYe_03aend = scene_HeroStory_HYe_03aend

function scene_HeroStory_HYe_03aend:stage(args)
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
				id = "HeroStory_music",
				fileName = "Mus_Story_Home",
				type = "Music"
			},
			{
				id = "Se_Story_Marble",
				fileName = "Se_Story_Marble",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 333,
				visible = false,
				id = "mengjinga_In",
				scale = 1.05,
				actionName = "mengjinga_juqingtexiao",
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

function scene_HeroStory_HYe_03aend.actions.start_HeroStory_HYe_03aend(_root, args)
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
					name = "鳳凰月華",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>哼，看在你們這麼努力的份上，我就勉為其難聽聽你們的說法。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>如果能夠說服我……，停工什麼的再考慮考慮。</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>這附近似乎發生了神隱事件……</outline></font>",
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>我們遭到了夢魘的襲擊……</outline></font>"
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
					modelId = "Model_Story_ZTXChang",
					id = "ZTXChang_speak",
					rotationX = 0,
					scale = 1.08,
					zorder = 4,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.5,
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>這附近似乎發生了神隱事件，我們也是因此而被派來這裏調查，在之前也確實遭到了夢魘的襲擊……</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>為了工作人員的安危，還是先行停工比較妥當。</outline></font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>妳以為我在這只是裝飾嗎？區區夢魘能奈我鳳凰月華如何？</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>若是只有這樣的理由，妳們還是回去報告神隱事件由不死鳥財團全權負責。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>這邊將成為不死鳥財團未來的夢魘研究與對策中心，若怕區區的夢魘還做什麼研究。</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>……</outline></font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>嘖，你也太容易就被駁倒了吧！笨蛋。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>在上一次與魔神仔……夢魘的戰鬥中，在碰到夢魘時我看到了石虎的記憶……。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>因為開發的關係，石虎媽媽帶著兩只小石虎為了覓食不斷移動。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>雖然重機具沒有傷害到他們，但卻因為要逃避開發進行了長途的遷徙，不得不面對充滿危險的馬路與人類蓄意或無意的傷害。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>在當時的夢境中，雖然他們千鈞一髮通過馬路，但……最後小石虎卻依然命喪在捕獸鋏之下。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>凡人講的話可真是又臭又長。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>所以，重點是妳覺得這些小動物小貓咪的生命比起開發來得重要？</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>或者是說，比起對抗夢魘來得重要嗎？</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>就說我是石琥不是小貓咪！……當然開發或對抗夢魘都很重要。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>但這片山林並不是屬於我們的，而是石虎與動物們的棲身之處。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我想讓村裏的小鬼長大後，還有機會看到牠們的蹤影。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>難道沒有能讓石虎生存與開發平衡的可能？</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>哼，妳也太自大了，天真的小貓咪……</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>不死鳥財團可是付出了相當高的金額買下了這座山頭，這片山林當然不是屬於你們的，而是不死鳥財團的。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>還是…妳們可以支付同樣的金額把這座山買回去呢？</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>這……</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>等等…不太對勁！</font>"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					height = 2,
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>前方的空間不住的扭曲變形，彷彿變形蟲一樣的恣意伸展。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>很快地眾人周邊的空間就被這變形蟲一般的觸手吞噬殆盡，陷入了曖昧不明的夢境空間。</font>"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "mengjinga_In")
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
			actor = __getnode__(_root, "mengjinga_In")
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Marble")
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
							"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>一道漆黑的人影，緩步朝著眾人走來……。</font>"
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
					duration = 3
				}
			end
		})
	})
end

local function HeroStory_HYe_03aend(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HeroStory_HYe_03aend",
					scene = scene_HeroStory_HYe_03aend
				}
			end
		})
	})
end

stories.HeroStory_HYe_03aend = HeroStory_HYe_03aend

return _M
