local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_HeroLevelUp")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideHeroLevelUp = {
	actions = {}
}
scenes.scene_guideHeroLevelUp = scene_guideHeroLevelUp

function scene_guideHeroLevelUp:stage(args)
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

function scene_guideHeroLevelUp.actions.guide_HeroLevelUp(_root, args)
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
		click({
			args = function (_ctx)
				return {
					id = "home.servant_btn",
					arrowPos = 3,
					statisticPoint = "guide_HeroLevelUp_1",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_106_1",
						dir = 0
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
					statisticPoint = "guide_HeroLevelUp_2",
					id = "heroShowList.heroNode",
					arrowPos = 3,
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = -100,
						y = 0
					},
					clickOffset = {
						x = 0,
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
		branch({
			{
				cond = function (_ctx)
					return _ctx:gotoStory("guide_plot_9start")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "goto_story_end"
							}
						end
					})
				})
			}
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "heroShowMain.infoNode",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_HeroLevelUp_3",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_106_2",
						dir = 2
					},
					maskSize = {
						w = 270,
						h = 250
					},
					offset = {
						x = 50,
						y = -50
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "heroShowMain.infoPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_HeroLevelUp_4",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_106_3",
						dir = 0
					},
					maskSize = {
						w = 250,
						h = 250
					},
					offset = {
						x = -30,
						y = 5
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "heroShowMain.levelUpBtn",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_HeroLevelUp_5",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_106_4",
						dir = 0
					},
					maskSize = {
						w = 116,
						h = 120
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "heroShowMain.skillPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_HeroLevelUp_6",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_106_5",
						dir = 0
					},
					maskSize = {
						w = 336,
						h = 105
					},
					offset = {
						x = -20,
						y = 10
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "heroShowMain.levelUpBtn",
					statisticPoint = "guide_HeroLevelUp_7",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_106_6",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_HeroStrengthLevelMediator",
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
					id = "HeroStrengthLevelMediator.itemNode",
					statisticPoint = "guide_HeroLevelUp_8",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_106_7",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "click_HeroUpLevel_itemNode",
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
					id = "HeroStrengthLevelMediator.itemNode",
					statisticPoint = "guide_HeroLevelUp_9",
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
					type = "click_HeroUpLevel_itemNode",
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
					id = "HeroStrengthLevelMediator.itemNode",
					statisticPoint = "guide_HeroLevelUp_10",
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
					type = "click_HeroUpLevel_itemNode",
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
					id = "HeroStrengthLevelMediator.itemNode",
					statisticPoint = "guide_HeroLevelUp_11",
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
					type = "click_HeroUpLevel_itemNode",
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
					id = "HeroStrengthLevelMediator.upBtn",
					statisticPoint = "guide_HeroLevelUp_12",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 8
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "click_HeroUpLevel_upBtn",
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
					return _ctx:gotoStory("guide_plot_9end")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "goto_story_end"
							}
						end
					})
				})
			}
		})
	})
end

local function guide_HeroLevelUp(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_HeroLevelUp",
					scene = scene_guideHeroLevelUp
				}
			end
		})
	})
end

stories.guide_HeroLevelUp = guide_HeroLevelUp

return _M
