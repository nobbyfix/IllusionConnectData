local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_HeroStarUp")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_HeroStarUp = {
	actions = {}
}
scenes.scene_guide_HeroStarUp = scene_guide_HeroStarUp

function scene_guide_HeroStarUp:stage(args)
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

function scene_guide_HeroStarUp.actions.guide_HeroStarUp(_root, args)
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
					return _ctx:showNewSystemUnlock("Hero_StarUp")
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
					clickOffset = {
						x = 0,
						y = 0
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
					return _ctx:getUpStarHeroSta()
				end,
				subnode = sequential({
					act({
						action = "updateNode",
						actor = __getnode__(_root, "curtain"),
						args = function (_ctx)
							return {
								visible = false
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "heroShowMain.tabbtn_3",
								arrowPos = 1,
								mask = {
									touchMask = true,
									opacity = 0
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
					guideShow({
						args = function (_ctx)
							return {
								maskRes = "asset/story/zhandou_mask09.png",
								complexityNum = 9,
								id = "heroShowMain.starCostPanel",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								offset = {
									x = -20,
									y = 75
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "heroShowMain.starbtn",
								mask = {
									touchMask = true,
									opacity = 0
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
								type = "exit_HeroStarUpTipMediator"
							}
						end
					})
				})
			}
		})
	})
end

local function guide_HeroStarUp(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_HeroStarUp",
					scene = scene_guide_HeroStarUp
				}
			end
		})
	})
end

stories.guide_HeroStarUp = guide_HeroStarUp

return _M
