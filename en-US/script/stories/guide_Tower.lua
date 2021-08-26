local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Tower")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideTower = {
	actions = {}
}
scenes.scene_guideTower = scene_guideTower

function scene_guideTower:stage(args)
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

function scene_guideTower.actions.guide_Tower_Action(_root, args)
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
					return _ctx:showNewSystemUnlock("Unlock_Tower_1")
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
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "Mirror_Guideihand_1",
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
					id = "functionEntrance.node_tower",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "Mirror_Guideihand_2",
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
					type = "enter_TowerMain_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_Tower(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_Tower_Action",
					scene = scene_guideTower
				}
			end
		})
	})
end

stories.guide_Tower = guide_Tower

return _M
