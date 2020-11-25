local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Stage_Practice")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Stage_Practice = {
	actions = {}
}
scenes.scene_guide_Stage_Practice = scene_guide_Stage_Practice

function scene_guide_Stage_Practice:stage(args)
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

function scene_guide_Stage_Practice.actions.action_guide_Stage_Practice(_root, args)
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
					return _ctx:showNewSystemUnlock("Stage_Practice")
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
					return _ctx:gotoStory("guide_plot_34")
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
		click({
			args = function (_ctx)
				return {
					id = "home.challenge_btn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 300,
						height = 100
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
					id = "functionEntrance.node_practice",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 2272,
						height = 1280
					},
					offset = {
						x = 0,
						y = 0
					},
					clickOffset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_201_2",
						position = {
							refpt = {
								x = 0.45,
								y = 0.25
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_StagePracticeEnter_view",
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
					id = "StagePracticeEnter.esay",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 300,
						height = 100
					},
					offset = {
						x = 0,
						y = 20
					},
					clickOffset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_201_3",
						position = {
							refpt = {
								x = 0.3,
								y = 0.2
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					complexityNum = 9,
					type = "enter_StagePractice_view",
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
					id = "StagePracticeMediator.missionList",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_201_1",
						dir = 0
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "StagePracticeMediator.rewardInfo",
					complexityNum = 9,
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_201_2",
						dir = 0
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					complexityNum = 9,
					id = "StagePractice.challengeBtn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 300,
						height = 100
					},
					offset = {
						x = 0,
						y = 110
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					complexityNum = 9,
					type = "enter_StagePracticeTeam_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_Stage_Practice(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Stage_Practice",
					scene = scene_guide_Stage_Practice
				}
			end
		})
	})
end

stories.guide_Stage_Practice = guide_Stage_Practice

return _M
