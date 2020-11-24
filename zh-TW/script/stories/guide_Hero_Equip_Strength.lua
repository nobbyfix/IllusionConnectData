local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Hero_Equip_Strength")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Hero_Equip_Strength = {
	actions = {}
}
scenes.scene_guide_Hero_Equip_Strength = scene_guide_Hero_Equip_Strength

function scene_guide_Hero_Equip_Strength:stage(args)
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

function scene_guide_Hero_Equip_Strength.actions.action_guide_Hero_Equip_Strength(_root, args)
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
					return _ctx:showNewSystemUnlock("Hero_Equip")
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
		branch({
			{
				cond = function (_ctx)
					return _ctx:gotoStory("guide_plot_35")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Hero_Equip_Strength_1",
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
					id = "home.servant_btn",
					arrowPos = 3,
					statisticPoint = "guide_Hero_Equip_Strength_2",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 10
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_heroShowList_view",
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
					id = "heroShowList.heroNode",
					arrowPos = 3,
					statisticPoint = "guide_Hero_Equip_Strength_3",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = -100,
						y = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_heroShowMain_view",
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
					id = "heroShowMain.tabbtn_5",
					arrowPos = 3,
					statisticPoint = "guide_Hero_Equip_Strength_4",
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
					type = "enter_heroShowMain_view",
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
					id = "heroShowMain.equipBtn",
					arrowPos = 3,
					statisticPoint = "guide_Hero_Equip_Strength_5",
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
					type = "click_heroShowMain_equipBtn",
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
					id = "heroShowMain.equipNode1",
					arrowPos = 3,
					statisticPoint = "guide_Hero_Equip_Strength_6",
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
					type = "click_heroShowMain_equipNode1",
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
					id = "heroShowMain.strengthenBtn",
					arrowPos = 1,
					statisticPoint = "guide_Hero_Equip_Strength_7",
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
		wait({
			args = function (_ctx)
				return {
					type = "enter_EquipMainMediator",
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
					return _ctx:getHeroEquipLvUpSta()
				end,
				subnode = sequential({
					click({
						args = function (_ctx)
							return {
								id = "EquipMainMediator.quickBtn",
								arrowPos = 3,
								statisticPoint = "guide_Hero_Equip_Strength_8",
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
					wait({
						args = function (_ctx)
							return {
								type = "click_EquipMainMediator_quickBtn",
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
								id = "EquipMainMediator.strengthenBtn",
								arrowPos = 3,
								statisticPoint = "guide_Hero_Equip_Strength_9",
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
			}
		})
	})
end

local function guide_Hero_Equip_Strength(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Hero_Equip_Strength",
					scene = scene_guide_Hero_Equip_Strength
				}
			end
		})
	})
end

stories.guide_Hero_Equip_Strength = guide_Hero_Equip_Strength

return _M
