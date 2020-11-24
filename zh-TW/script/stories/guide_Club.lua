local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Club")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideClub = {
	actions = {}
}
scenes.scene_guideClub = scene_guideClub

function scene_guideClub:stage(args)
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

function scene_guideClub.actions.action_guide_Club(_root, args)
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
					return _ctx:showNewSystemUnlock("Club_System")
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
					id = "home.guild_btn",
					statisticPoint = "guide_Club_1",
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
					return _ctx:checkComplexityNum(9)
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "enter_ClubMediator",
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
								id = "ClubApplyMediator.mainPanel",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_Club_2",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_224_1",
									dir = 1
								},
								maskSize = {
									w = 704,
									h = 380
								},
								offset = {
									x = -180,
									y = 50
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Club_3",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_224_2",
									dir = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "ClubApplyMediator.createclubbtn",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_Club_4",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_224_3",
									dir = 0
								},
								maskSize = {
									w = 150,
									h = 70
								},
								offset = {
									x = 0,
									y = 13
								}
							}
						end
					}),
					branch({
						{
							cond = function (_ctx)
								return _ctx:gotoStory("guide_plot_30")
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											statisticPoint = "guide_Club_5",
											type = "goto_story_end"
										}
									end
								})
							})
						}
					})
				})
			}
		})
	})
end

local function guide_Club(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Club",
					scene = scene_guideClub
				}
			end
		})
	})
end

stories.guide_Club = guide_Club

return _M
