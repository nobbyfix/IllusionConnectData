local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Master_Skill")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Master_Skill = {
	actions = {}
}
scenes.scene_guide_Master_Skill = scene_guide_Master_Skill

function scene_guide_Master_Skill:stage(args)
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

function scene_guide_Master_Skill.actions.action_guide_Master_Skill(_root, args)
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
					return _ctx:gotoStory("guide_plot_26start")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Master_Skill_1",
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
					id = "home.cardsGroup_btn",
					statisticPoint = "guide_Master_Skill_2",
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
					type = "enter_stageTeam_view",
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
					id = "StageTeam.masterSkillBtn",
					statisticPoint = "guide_Master_Skill_3",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_Master_Skill(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Master_Skill",
					scene = scene_guide_Master_Skill
				}
			end
		})
	})
end

stories.guide_Master_Skill = guide_Master_Skill

return _M
