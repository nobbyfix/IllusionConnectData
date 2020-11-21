local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Achievement")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Achievement = {
	actions = {}
}
scenes.scene_guide_Achievement = scene_guide_Achievement

function scene_guide_Achievement:stage(args)
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

function scene_guide_Achievement.actions.action_guide_Achievement(_root, args)
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
		click({
			args = function (_ctx)
				return {
					id = "home.task_btn",
					arrowPos = 3,
					statisticPoint = "guide_Achievement_1",
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
					return _ctx:checkComplexityNum(9)
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "enter_TaskMediator_view",
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
								id = "TaskMediator.Task_Achievement",
								arrowPos = 3,
								statisticPoint = "guide_Achievement_2",
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
								type = "enter_TaskAchieveMediator",
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
								return _ctx:gotoStory("guide_plot_29")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Achievement_3",
											type = "goto_story_end"
										}
									end
								})
							})
						}
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "TaskAchieveMediator.tapPanel",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_Achievement_4",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_223_2",
									dir = 2
								},
								maskSize = {
									w = 140,
									h = 500
								},
								offset = {
									x = -20,
									y = -180
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "TaskAchieveMediator.viewPanel",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_Achievement_5",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_223_3",
									dir = 2
								},
								maskSize = {
									w = 830,
									h = 340
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
								id = "TaskAchieveMediator.cell1",
								arrowPos = 3,
								statisticPoint = "guide_Achievement_6",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_223_4",
									dir = 2
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Achievement(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Achievement",
					scene = scene_guide_Achievement
				}
			end
		})
	})
end

stories.guide_Achievement = guide_Achievement

return _M
