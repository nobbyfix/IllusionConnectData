local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_DailyQuest")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_DailyQuest = {
	actions = {}
}
scenes.scene_guide_DailyQuest = scene_guide_DailyQuest

function scene_guide_DailyQuest:stage(args)
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

function scene_guide_DailyQuest.actions.action_guide_DailyQuest(_root, args)
	return sequential({
		act({
			action = "updateNode",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					visible = false
				}
			end
		}),
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
					return _ctx:showNewSystemUnlock("DailyQuest")
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
					id = "home.task_btn",
					arrowPos = 4,
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
					type = "enter_TaskDailyMediator",
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
					id = "TaskDaily.getReward_btn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_206_2",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					},
					offset = {
						x = 210,
						y = -40
					}
				}
			end
		})
	})
end

local function guide_DailyQuest(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_DailyQuest",
					scene = scene_guide_DailyQuest
				}
			end
		})
	})
end

stories.guide_DailyQuest = guide_DailyQuest

return _M
