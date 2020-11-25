local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_3")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_3 = {
	actions = {}
}
scenes.scene_guide_Village_Building_3 = scene_guide_Village_Building_3

function scene_guide_Village_Building_3:stage(args)
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

function scene_guide_Village_Building_3.actions.action_guide_Village_Building_3(_root, args)
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
					return _ctx:checkGuideSta("Village3")
				end,
				subnode = sequential({
					branch({
						{
							cond = function (_ctx)
								return _ctx:gotoStory("guide_plot_12start")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Village_Building_3_3",
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
								id = "home.village_btn",
								arrowPos = 2,
								statisticPoint = "guide_Village_Building_3_5",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_217_1",
									dir = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_BuildingDecorate_view",
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
								id = "BuildingDecorate.coinCharge",
								arrowPos = 3,
								statisticPoint = "guide_Village_Building_3_6",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									dir = 0,
									heroId = "CLMan",
									text = "NewPlayerGuide_217_2"
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Village_Building_3(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_3",
					scene = scene_guide_Village_Building_3
				}
			end
		})
	})
end

stories.guide_Village_Building_3 = guide_Village_Building_3

return _M
