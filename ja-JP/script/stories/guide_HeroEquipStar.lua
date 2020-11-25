local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_HeroEquipStar")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideHeroEquipStar = {
	actions = {}
}
scenes.scene_guideHeroEquipStar = scene_guideHeroEquipStar

function scene_guideHeroEquipStar:stage(args)
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

function scene_guideHeroEquipStar.actions.guide_HeroEquipStar_action(_root, args)
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
					return _ctx:showNewSystemUnlock("Equip_StarUp")
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
					id = "home.servant_btn",
					arrowPos = 4,
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_215_1",
						position = {
							refpt = {
								x = 0.35,
								y = 0.35
							}
						}
					},
					offset = {
						x = 40,
						y = 0
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
					id = "heroShowList.equipBtn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 5
					},
					textArgs = {
						text = "NewPlayerGuide_215_2",
						position = {
							refpt = {
								x = 0.6,
								y = 0.3
							}
						}
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
		click({
			args = function (_ctx)
				return {
					id = "EquipMainMediator.tabBtn_btn_star",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_215_3",
						position = {
							refpt = {
								x = 0.6,
								y = 0.4
							}
						}
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
		click({
			args = function (_ctx)
				return {
					id = "EquipMainMediator.equipCell_2",
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
					id = "EquipMainMediator.btn_starup",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_215_3",
						position = {
							refpt = {
								x = 0.6,
								y = 0.4
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "Guide_Equip_Star_Up_SUC",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_HeroEquipStar(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_HeroEquipStar_action",
					scene = scene_guideHeroEquipStar
				}
			end
		})
	})
end

stories.guide_HeroEquipStar = guide_HeroEquipStar

return _M
