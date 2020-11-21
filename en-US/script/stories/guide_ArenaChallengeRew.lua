local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_ArenaChallengeRew")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideArenaChallengeRew = {
	actions = {}
}
scenes.scene_guideArenaChallengeRew = scene_guideArenaChallengeRew

function scene_guideArenaChallengeRew:stage(args)
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
		children = {},
		__actions__ = self.actions
	}
end

function scene_guideArenaChallengeRew.actions.action_guide_ArenaChallengeRew(_root, args)
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
					return _ctx:showNewSystemUnlock("Arena_System")
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
					return _ctx:gotoStory("guide_plot_19start")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_ArenaChallengeRew_1",
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
					id = "home.arena_btn",
					statisticPoint = "guide_ArenaChallengeRew_2",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 10,
						y = -15
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_FunctionEntrance_view",
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
					id = "functionEntrance.node_1",
					statisticPoint = "guide_ArenaChallengeRew_3",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 10,
						y = 10
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_ArenaMediator",
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
					complexityNum = 9,
					statisticPoint = "guide_ArenaChallengeRew_4",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_211_1",
						dir = 0
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "ArenaMediator.rolePanel",
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_ArenaChallengeRew_5",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_211_2",
						dir = 2
					},
					maskSize = {
						w = 1100,
						h = 320
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "ArenaMediator.progressPanel",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_ArenaChallengeRew_6",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_211_3",
						dir = 0
					},
					maskSize = {
						w = 760,
						h = 160
					},
					offset = {
						x = 380,
						y = 60
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "ArenaMediator.refreshButton",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask08.png",
					statisticPoint = "guide_ArenaChallengeRew_7",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_211_4",
						dir = 0
					},
					maskSize = {
						w = 220,
						h = 90
					},
					offset = {
						x = 0,
						y = 14
					}
				}
			end
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:gotoStory("guide_plot_19end", 9)
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_ArenaChallengeRew_16",
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
					id = "ArenaMediator.fightNode",
					statisticPoint = "guide_ArenaChallengeRew_17",
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
					complexityNum = 9,
					type = "enter_ArenaRoleInfoMediator",
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
					id = "ArenaRoleInfoMediator.battleBtn",
					statisticPoint = "guide_ArenaChallengeRew_18",
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
end

local function guide_ArenaChallengeRew(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_ArenaChallengeRew",
					scene = scene_guideArenaChallengeRew
				}
			end
		})
	})
end

stories.guide_ArenaChallengeRew = guide_ArenaChallengeRew

return _M
