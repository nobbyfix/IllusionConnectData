local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_6")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_6 = {
	actions = {}
}
scenes.scene_guide_Village_Building_6 = scene_guide_Village_Building_6

function scene_guide_Village_Building_6:stage(args)
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

function scene_guide_Village_Building_6.actions.action_guide_Village_Building_6(_root, args)
	return sequential({
		branch({
			{
				cond = function (_ctx)
					return _ctx:checkGuideSta("Village6")
				end,
				subnode = sequential({
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
								return _ctx:gotoStory("guide_plot_20")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Village_Building_6_1",
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
								statisticPoint = "guide_Village_Building_6_2",
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
					click({
						args = function (_ctx)
							return {
								id = "BuildingView.button_overview",
								arrowPos = 2,
								statisticPoint = "guide_Village_Building_6_3",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									dir = 0,
									heroId = "CLMan",
									text = "NewPlayerGuide_220_3"
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
								type = "enter_buildingOver_view",
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
								id = "BuildingOverview.Room5",
								statisticPoint = "guide_Village_Building_6_4",
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
								id = "BuildingOverview.lvupBtn",
								statisticPoint = "guide_Village_Building_6_5",
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
								type = "enter_buildingBuildSuc_view",
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
								complexityNum = 9,
								id = "BuildingLvUpSuc.closeBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 2272,
									height = 1280
								},
								offset = {
									x = 100,
									y = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								complexityNum = 9,
								statisticPoint = "guide_Village_Building_6_6",
								type = "close_BuildingToast_view",
								mask = {
									touchMask = true,
									opacity = 0
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Village_Building_6(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_6",
					scene = scene_guide_Village_Building_6
				}
			end
		})
	})
end

stories.guide_Village_Building_6 = guide_Village_Building_6

return _M
