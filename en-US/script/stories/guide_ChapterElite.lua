local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_ChapterElite")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideChapterElite = {
	actions = {}
}
scenes.scene_guideChapterElite = scene_guideChapterElite

function scene_guideChapterElite:stage(args)
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

function scene_guideChapterElite.actions.guide_ChapterElite_action(_root, args)
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
					return _ctx:showNewSystemUnlock("Elite_Block")
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
					id = "home.explore_btn",
					statisticPoint = "guide_ChapterElite_1",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_208_1",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_commonStageMain_view",
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
					id = "commonStageMain.btnImg",
					statisticPoint = "guide_ChapterElite_2",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_208_2",
						dir = 0
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
					type = "enter_commonStageMain_view",
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
					id = "commonStageMain.cellChapter1",
					statisticPoint = "guide_ChapterElite_3",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 280,
						height = 100
					},
					offset = {
						x = 130,
						y = 50
					},
					textArgs = {
						text = "NewPlayerGuide_208_3",
						dir = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_commonStageChapterDetail_view",
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
					id = "commonStageChapterDetail.btn_1",
					maskRes = "asset/story/zhandou_mask08.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "NewPlayerGuide_208_4",
						dir = 0
					},
					maskSize = {
						w = 379,
						h = 75
					},
					offset = {
						x = 30,
						y = -35
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "commonStageChapterDetail.btn_1",
					statisticPoint = "guide_ChapterElite_4",
					mask = {
						touchMask = true,
						opacity = 0
					},
					clickSize = {
						width = 160,
						height = 170
					},
					textArgs = {
						text = "NewPlayerGuide_208_5",
						dir = 0
					},
					offset = {
						x = 0,
						y = 35
					}
				}
			end
		})
	})
end

local function guide_ChapterElite(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_ChapterElite_action",
					scene = scene_guideChapterElite
				}
			end
		})
	})
end

stories.guide_ChapterElite = guide_ChapterElite

return _M
