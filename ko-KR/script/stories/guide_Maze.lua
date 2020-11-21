local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Maze")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideMaze = {
	actions = {}
}
scenes.scene_guideMaze = scene_guideMaze

function scene_guideMaze:stage(args)
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

function scene_guideMaze.actions.guide_Maze_Action(_root, args)
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
		checkGuideView({}),
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
					return _ctx:showNewSystemUnlock("PansLabNormal")
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
					id = "home.mLabyrinth_btn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_217_1",
						position = {
							refpt = {
								x = 0.65,
								y = 0.35
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_MazeEventMainMediator",
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
					id = "MazeEventMainMediator.view1",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_217_2",
						position = {
							refpt = {
								x = 0.5,
								y = 0.65
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_MazeEventInfoMediator",
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
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_217_3",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					}
				}
			end
		})
	})
end

local function guide_Maze(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_Maze_Action",
					scene = scene_guideMaze
				}
			end
		})
	})
end

stories.guide_Maze = guide_Maze

return _M
