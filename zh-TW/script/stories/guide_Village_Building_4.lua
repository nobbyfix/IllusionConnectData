local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Village_Building_4")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Village_Building_4 = {
	actions = {}
}
scenes.scene_guide_Village_Building_4 = scene_guide_Village_Building_4

function scene_guide_Village_Building_4:stage(args)
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

function scene_guide_Village_Building_4.actions.action_guide_Village_Building_4(_root, args)
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
					return _ctx:checkGuideSta("Village4")
				end,
				subnode = sequential({
					click({
						args = function (_ctx)
							return {
								id = "home.village_btn",
								arrowPos = 2,
								statisticPoint = "guide_Village_Building_4_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									dir = 0,
									heroId = "CLMan",
									text = "NewPlayerGuide_220_1"
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
								return _ctx:checkGuideSta("VillageCanUnlockRoom", "Room5")
							end,
							subnode = sequential({
								click({
									args = function (_ctx)
										return {
											id = "BuildingView.UnlockRoom5",
											arrowPos = 3,
											statisticPoint = "guide_Village_Building_4_2",
											mask = {
												touchMask = true,
												opacity = 0
											},
											textArgs = {
												dir = 0,
												heroId = "CLMan",
												text = "NewPlayerGuide_220_2"
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "enter_buildingUnlockRoom_view",
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
											id = "BuildingUnlockRoom.button_ok",
											arrowPos = 3,
											statisticPoint = "guide_Village_Building_4_3",
											mask = {
												touchMask = true,
												opacity = 0
											}
										}
									end
								})
							})
						}
					}),
					click({
						args = function (_ctx)
							return {
								id = "BuildingView.button_overview",
								arrowPos = 2,
								statisticPoint = "guide_Village_Building_4_4",
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
								statisticPoint = "guide_Village_Building_4_5",
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
								statisticPoint = "guide_Village_Building_4_6",
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
								statisticPoint = "guide_Village_Building_4_7",
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
								statisticPoint = "guide_Village_Building_4_8",
								type = "close_BuildingToast_view",
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
								id = "BuildingView.button_back",
								complexityNum = 9,
								arrowPos = 1,
								statisticPoint = "guide_Village_Building_4_9",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									dir = 0,
									heroId = "CLMan",
									text = "NewPlayerGuide_220_4"
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								complexityNum = 9,
								type = "enter_building_main_view",
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
								id = "BuildingView.button_back",
								arrowPos = 1,
								statisticPoint = "guide_Village_Building_4_10",
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
								complexityNum = 9,
								type = "enter_home_view",
								mask = {
									touchMask = true
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "home.cardsGroup_btn",
								complexityNum = 9,
								statisticPoint = "guide_Village_Building_4_11",
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
								complexityNum = 9,
								type = "enter_stageTeam_view",
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
								id = "StageTeam.teamPet5",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_Village_Building_4_12",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									dir = 0,
									heroId = "CLMan",
									text = "NewPlayerGuide_220_5"
								},
								maskSize = {
									w = 100,
									h = 100
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Village_Building_4(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Village_Building_4",
					scene = scene_guide_Village_Building_4
				}
			end
		})
	})
end

stories.guide_Village_Building_4 = guide_Village_Building_4

return _M
