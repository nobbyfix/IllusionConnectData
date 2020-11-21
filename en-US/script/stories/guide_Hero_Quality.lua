local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Hero_Quality")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Hero_Quality = {
	actions = {}
}
scenes.scene_guide_Hero_Quality = scene_guide_Hero_Quality

function scene_guide_Hero_Quality:stage(args)
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

function scene_guide_Hero_Quality.actions.action_guide_Hero_Quality(_root, args)
	return sequential({
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCurViewName() == "homeView"
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "enter_home_view",
								mask = {
									touchMask = true
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
								return _ctx:gotoStory("guide_plot_18start")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Hero_Quality_1",
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
								statisticPoint = "guide_Hero_Quality_3",
								mask = {
									touchMask = true,
									opacity = 0
								}
							}
						end
					})
				})
			},
			{
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "enter_commonStageChapterDetail_view",
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
								return _ctx:gotoStory("guide_plot_18start")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Hero_Quality_1",
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
								id = "commonStageChapterDetail.btn_heroSystem",
								arrowPos = 3,
								statisticPoint = "guide_Hero_Quality_3",
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
					statisticPoint = "guide_Hero_Quality_4",
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
					id = "heroShowMain.levelUpBtn",
					statisticPoint = "guide_Hero_Quality_5",
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
					type = "enter_HeroStrengthMediator",
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
					statisticPoint = "guide_Hero_Quality_6",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_209_1",
						dir = 0
					}
				}
			end
		})
	})
end

local function guide_Hero_Quality(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Hero_Quality",
					scene = scene_guide_Hero_Quality
				}
			end
		})
	})
end

stories.guide_Hero_Quality = guide_Hero_Quality

return _M
