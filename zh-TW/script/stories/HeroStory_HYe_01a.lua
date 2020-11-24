local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HeroStory_HYe_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HeroStory_HYe_01a = {
	actions = {}
}
scenes.scene_HeroStory_HYe_01a = scene_HeroStory_HYe_01a

function scene_HeroStory_HYe_01a:stage(args)
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

function scene_HeroStory_HYe_01a.actions.start_HeroStory_HYe_01a(_root, args)
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					center = 1,
					heightSpace = 12,
					content = {
						"<font size='24' face='${fontName_FZYH_M}' color='#cecece'><shadow color='#050b15' blurRadius='3' offsetWidth='-0.5' offsetHeight='0.5'>某處山林小徑</shadow></font>"
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
							image = "HYe/HYe_face_1.png",
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>所以，魔神仔就是你們口中說的夢魘？</font>"
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
							x = 0.85,
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>我想是的，神隱事件由來已久且不限地域。<br/>捲入神隱事件的人們通常就再也回不來。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>也常有人雖然救回來了卻因為受到了太多的打擊導致精神異常……<br/>這些點上來看魔神仔跟夢魘倒是蠻像的。</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>還是別這麼快妄下定論吧</outline></font>"
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
					image = "ZTXChang/ZTXChang_face_5.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>嗯，需要等結束後再回去跟貝利爾先生好好討論一下。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>魔神仔事件我從小就常聽到，也許是因為家中是小廟的關係？<br/>遭遇到事件的家屬們都會到我們家裏來尋求幫助。</font>"
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
					image = "HYe/HYe_face_3.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>往常都是奶奶帶著一票人上山敲鑼打鼓找人……但這次被抓走的是我很熟的附近小鬼頭，加上奶奶又臥病在床……只好自己來了。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>但也因此家裏的守護神「虎爺」好像是為了保護我遭受攻擊而消失了……變成由我繼承牠的力量……還是有點搞不懂。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>妳應該就是與妳說的虎爺成功連結了吧？</font>"
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
					image = "ZTXChang/ZTXChang_face_5.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>抱歉，這是連結者們的術語，簡單的說就是取得了鏡片中的英魂認同，從而獲得了獲得了英魂的能力。</font>"
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
			action = "moveTo",
			actor = __getnode__(_root, "HYe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.25,
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
							x = 0.25,
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
							x = 0.25,
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
					name = "石琥",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>喵，我懂了，簡單的來說像是被神明附身降乩吧？</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>第一次看到有人可以秒理解小夜的說明！</outline></font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>不要以為所有人跟都你一樣笨！</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>倒是……妳說今天上來是為了想確認件事情，是有什麼線索嗎？</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>妳還不熟悉戰鬥……</outline></font>",
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>還是由我們來消滅夢魘比較好……</outline></font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>是石虎……</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>石虎？</outline></font>"
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
					image = "ZTXChang/ZTXChang_face_5.png",
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>石虎？</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>在上次的戰鬥之中，我看到了石虎的幻影，那一組石虎母子為了覓食不斷地遭遇到危險……，最後小石虎甚至命喪在捕獸鋏之下。</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>如果我想的沒錯的話，這大概就是魔神仔的原型。</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>咦？妳說的那個石虎……是動物嗎？</outline></font>",
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>我們還沒遇過動物變成的夢魘之主呢！</outline></font>"
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
					image = "ZTXChang/ZTXChang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
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
							x = 0.75,
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
					name = "村咲小夜",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>噓……</font>"
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>前面有動靜……</font>"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "HeroStory_music")
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 1
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
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>一群野生動物高速沖過眾人邊，背後還跟著為數眾多的夢魘。</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>這…這是怎麼回事！？</outline></font>"
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "石琥",
					speakings = {
						"HYe_speak"
					},
					content = {
						"<font size='24' face='${fontName_FZYH_R}' color='#ffffff'>小心！他們要過來了！</font>"
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

local function HeroStory_HYe_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HeroStory_HYe_01a",
					scene = scene_HeroStory_HYe_01a
				}
			end
		})
	})
end

stories.HeroStory_HYe_01a = HeroStory_HYe_01a

return _M
