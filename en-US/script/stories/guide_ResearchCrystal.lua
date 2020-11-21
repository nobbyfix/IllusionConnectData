local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_ResearchCrystal")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideResearchCrystal = {
	actions = {}
}
scenes.scene_guideResearchCrystal = scene_guideResearchCrystal

function scene_guideResearchCrystal:stage(args)
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

function scene_guideResearchCrystal.actions.guide_ResearchCrystal_Act(_root, args)
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
					return _ctx:showNewSystemUnlock("BlockSp_Crystal")
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
						text = "NewPlayerGuide_218_1",
						position = {
							refpt = {
								x = 0.3,
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
						text = "NewPlayerGuide_218_2",
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
		click({
			args = function (_ctx)
				return {
					id = "SpStageMainMediator.tabBtn_3",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 300,
						height = 100
					},
					offset = {
						x = -20,
						y = 10
					},
					textArgs = {
						text = "NewPlayerGuide_218_3",
						position = {
							refpt = {
								x = 0.4,
								y = 0.25
							}
						}
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
						text = "NewPlayerGuide_218_4",
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

local function guide_ResearchCrystal(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_ResearchCrystal_Act",
					scene = scene_guideResearchCrystal
				}
			end
		})
	})
end

stories.guide_ResearchCrystal = guide_ResearchCrystal

return _M
