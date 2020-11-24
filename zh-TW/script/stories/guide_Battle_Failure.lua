local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Battle_Failure")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideBattle_Failure = {
	actions = {}
}
scenes.scene_guideBattle_Failure = scene_guideBattle_Failure

function scene_guideBattle_Failure:stage(args)
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

function scene_guideBattle_Failure.actions.guide_Battle_Failure(_root, args)
	return sequential({
		wait({
			args = function (_ctx)
				return {
					type = "enter_StageLosePopView",
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
					return _ctx:gotoStory("guide_plot_13")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Battle_Failure_1",
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
					id = "StageLosePopView.equipBtn",
					arrowPos = 3,
					statisticPoint = "guide_Battle_Failure_2",
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
					type = "enter_heroShowList_view",
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
					statisticPoint = "guide_Battle_Failure_3",
					id = "heroShowList.heroNode",
					arrowPos = 3,
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = -100,
						y = 0
					},
					clickOffset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_heroShowMain_view",
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
					id = "heroShowMain.levelUpBtn",
					statisticPoint = "guide_Battle_Failure_4",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_218_1",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_HeroStrengthLevelMediator",
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
					id = "HeroStrengthLevelMediator.itemNode",
					statisticPoint = "guide_Battle_Failure_5",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_218_2",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "click_HeroUpLevel_itemNode",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_Battle_Failure(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_Battle_Failure",
					scene = scene_guideBattle_Failure
				}
			end
		})
	})
end

stories.guide_Battle_Failure = guide_Battle_Failure

return _M
