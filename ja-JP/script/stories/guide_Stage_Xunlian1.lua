local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_Stage_Xunlian1")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_Stage_Xunlian1 = {
	actions = {}
}
scenes.scene_guide_Stage_Xunlian1 = scene_guide_Stage_Xunlian1

function scene_guide_Stage_Xunlian1:stage(args)
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

function scene_guide_Stage_Xunlian1.actions.action_guide_Stage_Xunlian1(_root, args)
	return sequential({
		branch({
			{
				cond = function (_ctx)
					return _ctx:checkPointIsNotPass("P02S01")
				end,
				subnode = sequential({
					branch({
						{
							cond = function (_ctx)
								return _ctx:getCurViewName() == "homeView"
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											type = "enter_home_view",
											mask = {
												touchMask = true
											}
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "home.explore_btn",
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
											id = "commonStageMain.cellChapter2",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 140,
												height = 50
											},
											offset = {
												x = -220,
												y = 80
											}
										}
									end
								})
							})
						}
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
					guideShow({
						args = function (_ctx)
							return {
								id = "commonStageChapterDetail.btn_5",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_Stage_Xunlian1_1",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_216_1",
									dir = 1
								},
								maskSize = {
									w = 360,
									h = 80
								},
								offset = {
									x = 20,
									y = 36
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								statisticPoint = "guide_Stage_Xunlian1_2",
								id = "commonStageChapterDetail.btn_5",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 160,
									height = 170
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								offset = {
									x = 0,
									y = 35
								},
								textArgs = {
									text = "NewPlayerGuide_216_2",
									dir = 1
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_stagePointDetail_view",
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
								statisticPoint = "guide_Stage_Xunlian1_3",
								id = "stagePointDetail.challengeBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 190,
									height = 75
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								offset = {
									x = 0,
									y = 20
								},
								textArgs = {
									text = "NewPlayerGuide_216_3",
									dir = 1
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_Stage_Xunlian1(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_Stage_Xunlian1",
					scene = scene_guide_Stage_Xunlian1
				}
			end
		})
	})
end

stories.guide_Stage_Xunlian1 = guide_Stage_Xunlian1

return _M
