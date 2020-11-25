local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_8")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_8 = {
	actions = {}
}
scenes.scene_guide_Village_Building_8 = scene_guide_Village_Building_8

function scene_guide_Village_Building_8:stage(args)
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

function scene_guide_Village_Building_8.actions.action_guide_Village_Building_8(_root, args)
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
					id = "home.village_btn",
					arrowPos = 2,
					statisticPoint = "guide_Village_Building_8_1",
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
					type = "enter_building_view",
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
					return _ctx:gotoStory("guide_plot_23start")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Village_Building_8_2",
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
					id = "BuildingView.button_put",
					arrowPos = 2,
					statisticPoint = "guide_Village_Building_8_3",
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
					type = "enter_buildingPutHero_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		dragGuide({
			args = function (_ctx)
				return {
					statisticPoint = "guide_Village_Building_8_4",
					wait = "exit_buildingPutHeroView_dragEnd",
					drag = {
						id2 = "buildingPutHeroView.node_hero",
						id1 = "buildingPutHeroView.card1Node"
					},
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
					return _ctx:gotoStory("guide_plot_23end")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Village_Building_8_5",
								type = "goto_story_end"
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Village_Building_8(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_8",
					scene = scene_guide_Village_Building_8
				}
			end
		})
	})
end

stories.guide_Village_Building_8 = guide_Village_Building_8

return _M
