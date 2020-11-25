local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Explore")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Explore = {
	actions = {}
}
scenes.scene_guide_Explore = scene_guide_Explore

function scene_guide_Explore:stage(args)
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
		__actions__ = self.actions
	}
end

function scene_guide_Explore.actions.action_guide_Explore(_root, args)
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
					return _ctx:showNewSystemUnlock("Map_Explore")
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
					arrowPos = 3,
					statisticPoint = "guide_Explore_1",
					mask = {
						touchMask = true,
						opacity = 0
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
					id = "functionEntrance.node_explore",
					arrowPos = 3,
					statisticPoint = "guide_Explore_2",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_ExploreMediator",
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
					id = "ExploreMediator.firstPanel",
					arrowPos = 3,
					statisticPoint = "guide_Explore_4",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_207_1",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_ExploreStageMediator",
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
					id = "ExploreStageMediator.btnPoint",
					arrowPos = 3,
					statisticPoint = "guide_Explore_5",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_ExplorePointInfoMediator",
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
					id = "ExplorePointInfoMediator.targetDesc",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_Explore_6",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_207_2",
						dir = 0
					},
					maskSize = {
						w = 416,
						h = 80
					},
					offset = {
						x = -20,
						y = 20
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "ExplorePointInfoMediator.heroPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_Explore_7",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_207_3",
						dir = 0
					},
					maskSize = {
						w = 418,
						h = 102
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "ExplorePointInfoMediator.rewardPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_Explore_8",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_207_4",
						dir = 0
					},
					maskSize = {
						w = 416,
						h = 80
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "ExplorePointInfoMediator.enterBtn",
					complexityNum = 9,
					arrowPos = 3,
					statisticPoint = "guide_Explore_9",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_207_5",
						dir = 0
					}
				}
			end
		})
	})
end

local function guide_Explore(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Explore",
					scene = scene_guide_Explore
				}
			end
		})
	})
end

stories.guide_Explore = guide_Explore

return _M
