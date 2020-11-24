local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_KOF")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_KOF = {
	actions = {}
}
scenes.scene_guide_KOF = scene_guide_KOF

function scene_guide_KOF:stage(args)
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

function scene_guide_KOF.actions.action_guide_KOF(_root, args)
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
					return _ctx:showNewSystemUnlock("KOF")
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
					id = "home.arena_btn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 10,
						y = -15
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
					id = "functionEntrance.node_2",
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
		})
	})
end

local function guide_KOF(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_KOF",
					scene = scene_guide_KOF
				}
			end
		})
	})
end

stories.guide_KOF = guide_KOF

return _M
