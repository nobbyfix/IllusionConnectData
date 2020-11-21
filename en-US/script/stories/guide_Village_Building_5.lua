local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_5")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_5 = {
	actions = {}
}
scenes.scene_guide_Village_Building_5 = scene_guide_Village_Building_5

function scene_guide_Village_Building_5:stage(args)
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

function scene_guide_Village_Building_5.actions.action_guide_Village_Building_5(_root, args)
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
					return _ctx:checkGuideSta("Village5")
				end,
				subnode = sequential({
					click({
						args = function (_ctx)
							return {
								id = "home.village_btn",
								arrowPos = 2,
								statisticPoint = "guide_Village_Building_5_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_221_1",
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
								statisticPoint = "guide_Village_Building_5_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_221_2",
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
								id = "BuildingOverview.Room1",
								statisticPoint = "guide_Village_Building_5_3",
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
								statisticPoint = "guide_Village_Building_5_4",
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
								statisticPoint = "guide_Village_Building_5_5",
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

local function guide_Village_Building_5(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_5",
					scene = scene_guide_Village_Building_5
				}
			end
		})
	})
end

stories.guide_Village_Building_5 = guide_Village_Building_5

return _M
