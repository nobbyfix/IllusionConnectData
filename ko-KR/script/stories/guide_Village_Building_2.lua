local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_2")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_2 = {
	actions = {}
}
scenes.scene_guide_Village_Building_2 = scene_guide_Village_Building_2

function scene_guide_Village_Building_2:stage(args)
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

function scene_guide_Village_Building_2.actions.action_guide_Village_Building_2(_root, args)
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
					return _ctx:checkGuideSta("Village2")
				end,
				subnode = sequential({
					click({
						args = function (_ctx)
							return {
								id = "home.village_btn",
								arrowPos = 2,
								statisticPoint = "guide_Village_Building_2_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_215_1",
									dir = 0
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
								statisticPoint = "guide_Village_Building_2_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_215_2",
									dir = 0
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
								id = "BuildingOverview.Room6",
								statisticPoint = "guide_Village_Building_2_3",
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
					click({
						args = function (_ctx)
							return {
								id = "BuildingOverview.buildBtn",
								statisticPoint = "guide_Village_Building_2_4",
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
								arrowPos = 7,
								statisticPoint = "guide_Village_Building_2_5",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_215_3",
									dir = 0
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
								statisticPoint = "guide_Village_Building_2_6",
								complexityNum = 9,
								type = "close_BuildingToast_view",
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
								return _ctx:gotoStory("guide_plot_10", 9)
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Village_Building_2_7",
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
								id = "BuildingView.button_back",
								complexityNum = 9,
								arrowPos = 1,
								statisticPoint = "guide_Village_Building_2_8",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_215_4",
									dir = 1
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Village_Building_2(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_2",
					scene = scene_guide_Village_Building_2
				}
			end
		})
	})
end

stories.guide_Village_Building_2 = guide_Village_Building_2

return _M
