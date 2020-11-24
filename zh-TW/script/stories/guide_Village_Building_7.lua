local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_7")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_7 = {
	actions = {}
}
scenes.scene_guide_Village_Building_7 = scene_guide_Village_Building_7

function scene_guide_Village_Building_7:stage(args)
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

function scene_guide_Village_Building_7.actions.action_guide_Village_Building_7(_root, args)
	return sequential({
		branch({
			{
				cond = function (_ctx)
					return _ctx:checkGuideSta("Village7")
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
								return _ctx:gotoStory("guide_plot_21")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Village_Building_7_1",
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
								statisticPoint = "guide_Village_Building_7_2",
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
								statisticPoint = "guide_Village_Building_7_3",
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
								id = "BuildingOverview.Room1",
								statisticPoint = "guide_Village_Building_7_4",
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
								id = "BuildingOverview.buildNode2",
								statisticPoint = "guide_Village_Building_7_5",
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
								id = "BuildingOverview.buildBtn",
								statisticPoint = "guide_Village_Building_7_6",
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
								type = "notify_Building_refreshLayerBtn",
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
								id = "BuildingView.button_ok",
								arrowPos = 3,
								statisticPoint = "guide_Village_Building_7_7",
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
								statisticPoint = "guide_Village_Building_7_8",
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

local function guide_Village_Building_7(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_7",
					scene = scene_guide_Village_Building_7
				}
			end
		})
	})
end

stories.guide_Village_Building_7 = guide_Village_Building_7

return _M
