local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_MasterStarSkill")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideMasterStarSkill = {
	actions = {}
}
scenes.scene_guideMasterStarSkill = scene_guideMasterStarSkill

function scene_guideMasterStarSkill:stage(args)
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

function scene_guideMasterStarSkill.actions.guide_MasterStarSkill_enter(_root, args)
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
					return _ctx:showNewSystemUnlock("Master_StarUp")
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
					return _ctx:gotoStory("guide_plot_33")
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
					id = "home.master_btn",
					arrowPos = 3,
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
					type = "enter_MasterCultivateMediator",
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
					return _ctx:getMasterUpStar()
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
								id = "MasterCultivateMediator.tabBtn_2",
								arrowPos = 1,
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								textArgs = {
									text = "NewPlayerGuide_202_2",
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
								complexityNum = 9,
								type = "enter_MasterStarMediator",
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
								id = "MasterStarMediator.guide_star_bg",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_202_1",
									dir = 2
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
								id = "MasterStarMediator.guide_attr_bg",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_202_2",
									dir = 1
								},
								offset = {
									x = 0,
									y = 0
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "MasterStarMediator.starUpBtn",
								complexityNum = 9,
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								textArgs = {
									text = "NewPlayerGuide_202_5",
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
								complexityNum = 9,
								type = "click_MasterCultivateMediator_starUpBtn",
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

local function guide_MasterStarSkill(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_MasterStarSkill_enter",
					scene = scene_guideMasterStarSkill
				}
			end
		})
	})
end

stories.guide_MasterStarSkill = guide_MasterStarSkill

return _M
