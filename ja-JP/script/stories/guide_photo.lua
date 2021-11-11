local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_photo")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_photo = {
	actions = {}
}
scenes.scene_guide_photo = scene_guide_photo

function scene_guide_photo:stage(args)
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

function scene_guide_photo.actions.action_guide_photo(_root, args)
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
					return _ctx:showNewSystemUnlock("Hero_Gallery")
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
					return _ctx:gotoStory("guide_plot_22start")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_photo_1",
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
					id = "home.photo_btn",
					arrowPos = 3,
					statisticPoint = "guide_photo_2",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 15
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_GalleryBookMediator",
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
					id = "GalleryBookMediator.touchPanel4",
					statisticPoint = "guide_photo_8",
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
					type = "enter_GalleryPartnerNewMediator",
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
					id = "GalleryPartnerNewMediator.firstPanel",
					statisticPoint = "guide_photo_3",
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
					type = "enter_GalleryPartnerInfoNewMediator",
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
					id = "GalleryPartnerInfoNewMediator.jushiBtn",
					arrowPos = 3,
					statisticPoint = "guide_photo_4",
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
					statisticPoint = "guide_photo_6",
					type = "exit_GetRewardView_suc",
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
					return _ctx:gotoStory("guide_plot_22end")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								statisticPoint = "guide_photo_7",
								type = "goto_story_end"
							}
						end
					})
				})
			}
		})
	})
end

local function guide_photo(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_photo",
					scene = scene_guide_photo
				}
			end
		})
	})
end

stories.guide_photo = guide_photo

return _M
