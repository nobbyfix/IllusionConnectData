local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_MasterLeadeStage")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_masterLeadeStage = {
	actions = {}
}
scenes.scene_masterLeadeStage = scene_masterLeadeStage

function scene_masterLeadeStage:stage(args)
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

function scene_masterLeadeStage.actions.action_guide_MasterLeadeStage(_root, args)
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
					return _ctx:showNewSystemUnlock("LeadStage")
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
					id = "home.master_btn",
					arrowPos = 3,
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "Stage_Newbie_Guide01",
						dir = 1
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
					type = "enter_MasterCultivateMediator",
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
					id = "MasterCultivateMediator.tabBtn_4",
					arrowPos = 3,
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
					type = "enter_MasterLeadStageMediator",
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
					id = "MasterEmblemMediator.topemblemBg",
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "Stage_Newbie_Guide02",
						dir = 0
					},
					maskSize = {
						w = 150,
						h = 150
					},
					offset = {
						x = 0,
						y = 15
					}
				}
			end
		})
	})
end

local function guide_MasterLeadeStage(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_MasterLeadeStage",
					scene = scene_masterLeadeStage
				}
			end
		})
	})
end

stories.guide_MasterLeadeStage = guide_MasterLeadeStage

return _M
