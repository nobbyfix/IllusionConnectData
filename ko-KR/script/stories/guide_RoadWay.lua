local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_RoadWay")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_RoadWay = {
	actions = {}
}
scenes.scene_RoadWay = scene_RoadWay

function scene_RoadWay:stage(args)
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

function scene_RoadWay.actions.guide_RoadWay_Action(_root, args)
	return sequential({
		wait({
			args = function (_ctx)
				return {
					type = "enter_activity_blcok_view",
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
					id = "activityblock.back_btn",
					arrowPos = 3,
					statisticPoint = "guide_Achievement_1",
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
					type = "enter_magic_view",
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
					return _ctx:gotoStory("guide_minigame_TrialRoad")
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
					id = "activityblock.btnRoadWay",
					arrowPos = 3,
					statisticPoint = "guide_Achievement_1",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_RoadWay(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_RoadWay_Action",
					scene = scene_RoadWay
				}
			end
		})
	})
end

stories.guide_RoadWay = guide_RoadWay

return _M
