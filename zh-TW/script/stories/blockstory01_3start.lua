local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.blockstory01_3start")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_blockstory01_3start = {
	actions = {}
}
scenes.scene_blockstory01_3start = scene_blockstory01_3start

function scene_blockstory01_3start:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1386,
			height = 852
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
						image = "bg_story_cg_01_2.jpg",
						layoutMode = 1,
						zorder = 3,
						id = "bg",
						scale = 1,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0.41
							}
						}
					}
				}
			},
			{
				id = "Mus_Story_Danger_Loop",
				fileName = "Mus_Story_Danger",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_blockstory01_3start.actions.start_blockstory01_3start(_root, args)
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					center = 1,
					bgShow = false,
					heightSpace = 32,
					content = {
						"<font size='24' face='${fontName_FZYH_M}' color='#ffffff'>離維納斯陷阱不遠的路口處</font>"
					},
					durations = {
						0.06
					},
					waitTimes = {
						1
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
		sleep({
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
					name = "維多莉亞",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"<font size='26' face='${fontName_FZYH_R}' color='#ffffff'>匡扶正義，唯善是舉！騎士維多莉亞在此，夢魘休想通過！</font>"
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
					name = "妮娜",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"<font size='26' face='${fontName_FZYH_R}' color='#ffffff'>你們看！是學姐！</font>"
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
						"<font size='26' face='${fontName_FZYH_R}' color='#ffffff'>她這樣隻身上前，難道是想以自身當誘餌……</font>"
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
						"<font size='32' color='#ffffff'><outline color='#000000' size='1'>不好，我們快去支援！</outline></font>"
					}
				}
			end
		}),
		act({
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						255,
						255,
						255,
						255
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		})
	})
end

local function blockstory01_3start(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_blockstory01_3start",
					scene = scene_blockstory01_3start
				}
			end
		})
	})
end

stories.blockstory01_3start = blockstory01_3start

return _M
