local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_MasterEmblemAura")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideMasterEmblemAura = {
	actions = {}
}
scenes.scene_guideMasterEmblemAura = scene_guideMasterEmblemAura

function scene_guideMasterEmblemAura:stage(args)
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

function scene_guideMasterEmblemAura.actions.guide_MasterEmblemAura_action(_root, args)
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
					return _ctx:showNewSystemUnlock("Master_Auras")
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
					return _ctx:gotoStory("guide_plot_32")
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
		branch({
			{
				cond = function (_ctx)
					return _ctx:getMasterEmblemLvUpSta()
				end,
				subnode = sequential({
					click({
						args = function (_ctx)
							return {
								id = "MasterCultivateMediator.tabBtn_3",
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
								type = "enter_MasterEmblemMediator",
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
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask10.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_210_1",
									dir = 2
								},
								maskSize = {
									w = 920,
									h = 120
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "MasterEmblemMediator.attremblemBg",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask10.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_210_2",
									dir = 1
								},
								maskSize = {
									w = 270,
									h = 300
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "MasterEmblemMediator.emblemUpBtn",
								mask = {
									touchMask = true,
									opacity = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "click_MasterCultivateMediator_emblemUp",
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

local function guide_MasterEmblemAura(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_MasterEmblemAura_action",
					scene = scene_guideMasterEmblemAura
				}
			end
		})
	})
end

stories.guide_MasterEmblemAura = guide_MasterEmblemAura

return _M
