local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_BlockSp")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_BlockSp = {
	actions = {}
}
scenes.scene_guide_BlockSp = scene_guide_BlockSp

function scene_guide_BlockSp:stage(args)
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
		children = {},
		__actions__ = self.actions
	}
end

function scene_guide_BlockSp.actions.action_guide_BlockSp(_root, args)
	return sequential({
		wait({
			args = function (_ctx)
				return {
					type = "enter_home_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:isPlayerLevelUp()
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "exit_playerlevelup_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:showNewSystemUnlock("BlockSp_Entrance")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "exit_newsystem_view"
							}
						end
					})
				})
			}
		}),
		click({
			args = function (_ctx)
				return {
					id = "home.challenge_btn",
					statisticPoint = "guide_BlockSp_1",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_FunctionEntrance_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "functionEntrance.node_spstage",
					statisticPoint = "guide_BlockSp_2",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 300,
						height = 100
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_SpStageMainMediator",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:gotoStory("guide_plot_25")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_BlockSp_3",
								type = "goto_story_end"
							}
						end
					})
				})
			}
		}),
		click({
			args = function (_ctx)
				return {
					id = "SpStageRuleMediator.btnClose",
					statisticPoint = "guide_BlockSp_4",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 500,
						height = 500
					},
					offset = {
						x = 0,
						y = -220
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "exit_SpStageRuleMediator",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "SpStageMainMediator.rewardBg",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_BlockSp_5",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						dir = 0,
						heroId = "FTLEShi",
						text = "NewPlayerGuide_203_1"
					},
					maskSize = {
						w = 440,
						h = 94
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "SpStageMainMediator.heroPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_BlockSp_6",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						dir = 0,
						heroId = "FTLEShi",
						text = "NewPlayerGuide_203_2"
					},
					maskSize = {
						w = 440,
						h = 94
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "SpStageMainMediator.boxPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_BlockSp_7",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						dir = 0,
						heroId = "FTLEShi",
						text = "NewPlayerGuide_203_3"
					},
					maskSize = {
						w = 200,
						h = 60
					},
					offset = {
						x = 120,
						y = -72
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "SpStageMainMediator.button_battle",
					statisticPoint = "guide_BlockSp_8",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						dir = 0,
						heroId = "FTLEShi",
						text = "NewPlayerGuide_203_4"
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_SpStageDftMediator",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "SpStageDftMediator.btnBattle",
					statisticPoint = "guide_BlockSp_9",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_BlockSp(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_BlockSp",
					scene = scene_guide_BlockSp
				}
			end
		})
	})
end

stories.guide_BlockSp = guide_BlockSp

return _M
