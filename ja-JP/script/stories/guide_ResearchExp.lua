local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_ResearchExp")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideResearchExp = {
	actions = {}
}
scenes.scene_guideResearchExp = scene_guideResearchExp

function scene_guideResearchExp:stage(args)
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

function scene_guideResearchExp.actions.guide_ResearchExp_Act(_root, args)
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
					return _ctx:showNewSystemUnlock("BlockSp_Exp")
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
						x = 10,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_209_1",
						position = {
							refpt = {
								x = 0.35,
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
					id = "functionEntrance.node_4",
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
					},
					clickOffset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_209_2",
						position = {
							refpt = {
								x = 0.35,
								y = 0.5
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_SpStageMainMediator",
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
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_209_3",
						position = {
							refpt = {
								x = 0.3,
								y = 0.2
							}
						}
					}
				}
			end
		})
	})
end

local function guide_ResearchExp(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_ResearchExp_Act",
					scene = scene_guideResearchExp
				}
			end
		})
	})
end

stories.guide_ResearchExp = guide_ResearchExp

return _M
