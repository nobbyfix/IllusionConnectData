local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_TaskStage")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideTaskStage = {
	actions = {}
}
scenes.scene_guideTaskStage = scene_guideTaskStage

function scene_guideTaskStage:stage(args)
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

function scene_guideTaskStage.actions.guide_TaskStage(_root, args)
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
					return _ctx:showNewSystemUnlock("MainTask")
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
					textArgs = {
						text = "NewPlayerGuide_201_1",
						position = {
							refpt = {
								x = 0.5,
								y = 0.3
							}
						}
					},
					offset = {
						x = 40,
						y = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_TaskStageMediator",
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
					id = "TaskStageMediator.cangetBtn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_202_2",
						position = {
							refpt = {
								x = 0.55,
								y = 0.5
							}
						}
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
					type = "enter_getRewardMediator_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_TaskStage(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_TaskStage",
					scene = scene_guideTaskStage
				}
			end
		})
	})
end

stories.guide_TaskStage = guide_TaskStage

return _M
