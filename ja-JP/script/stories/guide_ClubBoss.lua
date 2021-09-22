local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_ClubBoss")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_ClubBoss = {
	actions = {}
}
scenes.scene_ClubBoss = scene_ClubBoss

function scene_ClubBoss:stage(args)
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

function scene_ClubBoss.actions.guide_ClubBoss_Action(_root, args)
	return sequential({
		guideShow({
			args = function (_ctx)
				return {
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "GroupBoss_Guideinfo_Text01",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "ClubBossMediator.guide_panel_1",
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "GroupBoss_Guideinfo_Text02",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
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
					id = "ClubBossMediator.guide_panel_2",
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "GroupBoss_Guideinfo_Text03",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
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
					id = "ClubBossMediator.guide_panel_3",
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "GroupBoss_Guideinfo_Text04",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
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

local function guide_ClubBoss(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_ClubBoss_Action",
					scene = scene_ClubBoss
				}
			end
		})
	})
end

stories.guide_ClubBoss = guide_ClubBoss

return _M
