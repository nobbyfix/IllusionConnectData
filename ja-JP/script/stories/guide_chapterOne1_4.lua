local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_chapterOne1_4")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideChapterOne1_4 = {
	actions = {}
}
scenes.scene_guideChapterOne1_4 = scene_guideChapterOne1_4

function scene_guideChapterOne1_4:stage(args)
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
		children = {
			{
				opacity = 0,
				type = "GuideEnterBattleAnim",
				id = "guideEnterBattleAnim",
				isVisible = false,
				position = {
					refpt = {
						x = 0.5,
						y = 0.5
					}
				}
			},
			{
				opacity = 0,
				type = "GuidePopViewAnim",
				id = "guidePopViewAnim",
				isVisible = false,
				position = {
					refpt = {
						x = 0.5,
						y = 0.5
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_guideChapterOne1_4.actions.guide_chapterOne1_4_action(_root, args)
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
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_enter_stage")
				end,
				subnode = sequential({
					act({
						action = "play",
						actor = __getnode__(_root, "guideEnterBattleAnim")
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
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_main_point_1_1")
				end,
				subnode = sequential({
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
					click({
						args = function (_ctx)
							return {
								id = "commonStageChapterDetail.btn_1",
								statisticPoint = "guide_main_stage_1_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
								},
								textArgs = {
									text = "NewPlayerGuide_101_1",
									dir = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								offset = {
									x = 0,
									y = 35
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
								id = "stagePointDetail.challengeBtn",
								statisticPoint = "guide_main_stage_1_1_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 380,
									height = 150
								},
								textArgs = {
									text = "NewPlayerGuide_101_2",
									dir = 1
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								offset = {
									x = 0,
									y = 20
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "dispose_newHero_view"
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_minigame_win_view"
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
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_main_point_1_2")
				end,
				subnode = sequential({
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
					click({
						args = function (_ctx)
							return {
								id = "commonStageChapterDetail.btn_2",
								statisticPoint = "guide_main_stage_1_2_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
								},
								textArgs = {
									text = "NewPlayerGuide_102_1",
									dir = 0
								},
								offset = {
									x = 0,
									y = 35
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
								id = "stagePointDetail.challengeBtn",
								statisticPoint = "guide_main_stage_1_2_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 380,
									height = 150
								},
								textArgs = {
									text = "NewPlayerGuide_102_2",
									dir = 1
								},
								offset = {
									x = 0,
									y = 20
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_minigame_win_view"
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
					click({
						args = function (_ctx)
							return {
								id = "commonStageChapterDetail.btnBack",
								arrowPos = 1,
								statisticPoint = "guide_main_stage_1_2_15",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 380,
									height = 150
								},
								offset = {
									x = 0,
									y = 20
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
					return _ctx:getCondResult("guide_recruit_hero")
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
								return _ctx:showNewSystemUnlock("Draw_Hero", "guide_main_recruit_1")
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
					guideShow({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_recruit_2",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_1",
									dir = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "home.explore_btn",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_3",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_2",
									dir = 0
								},
								maskSize = {
									w = 160,
									h = 160
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "home.servant_btn",
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_4",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_3",
									dir = 0
								},
								maskSize = {
									w = 120,
									h = 80
								},
								offset = {
									x = 0,
									y = 15
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "home.recruitEquip_btn",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_5",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_4",
									dir = 0
								},
								maskSize = {
									w = 120,
									h = 120
								},
								offset = {
									x = -16,
									y = 22
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "home.cardsGroup_btn",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_6",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_5",
									dir = 0
								},
								maskSize = {
									w = 130,
									h = 130
								},
								offset = {
									x = 0,
									y = 10
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "home.recruitEquip_btn",
								statisticPoint = "guide_main_recruit_7",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_103_6",
									dir = 0
								},
								offset = {
									x = -20,
									y = 20
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_recruitMain_view_open_normal",
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
								complexityNum = 9,
								statisticPoint = "guide_main_recruit_8",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_7",
									dir = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "recruitMain.recruitBtn1",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_9",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_8",
									dir = 0
								},
								maskSize = {
									w = 234,
									h = 94
								},
								offset = {
									x = 0,
									y = 14
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "recruitMain.recruitBtn2",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_10",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_9",
									dir = 0
								},
								maskSize = {
									w = 234,
									h = 94
								},
								offset = {
									x = 0,
									y = 14
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "recruitMain.recruitBtn1",
								statisticPoint = "guide_main_recruit_11",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_103_10",
									dir = 0
								},
								clickOffset = {
									x = 0,
									y = 14
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_newHero_view"
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "dispose_newHero_view"
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_recruit_15",
								id = "recruitHeroDiamondResul.okBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 2272,
									height = 1280
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								textArgs = {
									dir = 0,
									heroId = "CLMan",
									text = "NewPlayerGuide_103_11"
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_recruitHeroDiamondResul_view",
								mask = {
									opacity = 0,
									touchMask = true
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_recruit_16",
								id = "recruitMain.btnBack",
								arrowPos = 1,
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_recruitMain_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_main_embattle")
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
								return _ctx:showNewSystemUnlock("Hero_Group", "guide_main_recruit_17")
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
								id = "home.cardsGroup_btn",
								statisticPoint = "guide_main_recruit_18",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_103_12",
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
								type = "enter_stageTeam_view",
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
								statisticPoint = "guide_main_recruit_19",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_103_13",
									dir = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "StageTeam.info_bg",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_20",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_14",
									dir = 2
								},
								maskSize = {
									w = 222,
									h = 120
								},
								offset = {
									x = 0,
									y = 44
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "StageTeam.guidePanel1",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_21",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_15",
									dir = 2
								},
								maskSize = {
									w = 790,
									h = 270
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "StageTeam.guidePanel2",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_recruit_22",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_103_16",
									dir = 3
								}
							}
						end
					}),
					dragGuide({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_recruit_23",
								wait = "StageTeam_endNode_dragEnd",
								drag = {
									id2 = "StageTeam.teamPet2",
									id1 = "StageTeam.card1Node"
								},
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
								id = "StageTeam.btnBack",
								arrowPos = 1,
								statisticPoint = "guide_main_recruit_24",
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
								type = "exit_stageTeam_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_main_point_1_3")
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
					click({
						args = function (_ctx)
							return {
								id = "home.explore_btn",
								statisticPoint = "guide_main_stage_1_3_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_104_1",
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
					guideShow({
						args = function (_ctx)
							return {
								complexityNum = 9,
								statisticPoint = "guide_main_stage_1_3_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_104_2",
									dir = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								complexityNum = 9,
								statisticPoint = "guide_main_stage_1_3_3",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_104_3",
									dir = 0
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_stage_1_3_4",
								id = "commonStageMain.cellChapter1",
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
								clickOffset = {
									x = 0,
									y = 0
								},
								textArgs = {
									text = "NewPlayerGuide_104_4",
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
					click({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_stage_1_3_5",
								id = "commonStageChapterDetail.btn_3",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
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
									text = "NewPlayerGuide_104_5",
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
								statisticPoint = "guide_main_stage_1_3_6",
								id = "stagePointDetail.challengeBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 380,
									height = 150
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								offset = {
									x = 0,
									y = 20
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_minigame_win_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_main_point_1_4")
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
											id = "commonStageMain.cellChapter1",
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
											}
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
					click({
						args = function (_ctx)
							return {
								statisticPoint = "guide_main_stage_1_4_1",
								id = "commonStageChapterDetail.btn_4",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
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
									text = "NewPlayerGuide_105_1",
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
								statisticPoint = "guide_main_stage_1_4_2",
								id = "stagePointDetail.challengeBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 380,
									height = 150
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								offset = {
									x = 0,
									y = 20
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_minigame_win_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getCondResult("guide_main_story_2")
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
											id = "commonStageMain.cellChapter1",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 400,
												height = 400
											},
											offset = {
												x = 130,
												y = 50
											}
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
					click({
						args = function (_ctx)
							return {
								id = "commonStageChapterDetail.btn_5",
								statisticPoint = "guide_main_stage_1_4_9",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
								},
								offset = {
									x = 0,
									y = 35
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "story_play_end"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getChapterOneGetRewSta()
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
											complexityNum = 9,
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
											complexityNum = 9,
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
											complexityNum = 9,
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
											complexityNum = 9,
											id = "commonStageMain.cellChapter1",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 400,
												height = 400
											},
											offset = {
												x = 130,
												y = 50
											}
										}
									end
								})
							})
						}
					}),
					wait({
						args = function (_ctx)
							return {
								complexityNum = 9,
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
											complexityNum = 9,
											type = "exit_playerlevelup_view"
										}
									end
								})
							})
						}
					}),
					click({
						args = function (_ctx)
							return {
								complexityNum = 9,
								id = "CommonStageChapterDetailMediator.reward3",
								arrowPos = 7,
								statisticPoint = "guide_reward_click_chapter_1",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								complexityNum = 9,
								type = "enter_StageBoxRewardMediator",
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
								complexityNum = 9,
								id = "StageBoxRewardMediator.button",
								statisticPoint = "guide_reward_click_chapter_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 320,
									height = 340
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								complexityNum = 9,
								type = "getRew_CommonStageChapterDetailMediator",
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
								return _ctx:downloadRes()
							end,
							subnode = sequential({
								wait({
									args = function (_ctx)
										return {
											type = "download_150package_res_finish",
											mask = {
												touchMask = true,
												opacity = 0
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
								return _ctx:getCurViewName() == "CommonStageChapterView"
							end,
							subnode = sequential({
								click({
									args = function (_ctx)
										return {
											id = "commonStageChapterDetail.btnBack",
											arrowPos = 1,
											statisticPoint = "guide_main_stage_1_4_19",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 380,
												height = 150
											},
											offset = {
												x = 0,
												y = 20
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
											id = "commonStageMain.btnBack",
											arrowPos = 1,
											statisticPoint = "guide_main_stage_1_4_20",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 380,
												height = 150
											},
											offset = {
												x = 0,
												y = 20
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "enter_home_view_init",
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
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:checkVillageBuildingSta()
				end,
				subnode = sequential({
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
								return _ctx:showNewSystemUnlock("Village_Building", "guide_main_building_1")
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
								id = "home.village_btn",
								arrowPos = 2,
								statisticPoint = "guide_main_building_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_205_1",
									dir = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_building_view_init",
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
								return _ctx:gotoStory("guide_plot_7start")
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
					guideShow({
						args = function (_ctx)
							return {
								id = "BuildingView.button_overview",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_building_6",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_205_2",
									dir = 0
								},
								maskSize = {
									w = 120,
									h = 120
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
								id = "BuildingView.button_overview",
								complexityNum = 9,
								maskRes = "asset/story/zhandou_mask08.png",
								statisticPoint = "guide_main_building_7",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_205_3",
									dir = 0
								},
								maskSize = {
									w = 120,
									h = 120
								},
								offset = {
									x = 0,
									y = 0
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "BuildingView.button_overview",
								arrowPos = 2,
								statisticPoint = "guide_main_building_8",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_205_4",
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
								type = "enter_buildingOver_view",
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
								id = "BuildingOverview.Room3",
								statisticPoint = "guide_main_building_9",
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
					click({
						args = function (_ctx)
							return {
								id = "BuildingOverview.buildBtn",
								statisticPoint = "guide_main_building_10",
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
								type = "notify_Building_refreshLayerBtn",
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
								id = "BuildingView.button_ok",
								arrowPos = 3,
								statisticPoint = "guide_main_building_11",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_205_5",
									dir = 0
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
								type = "enter_buildingBuildSuc_view",
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
								id = "BuildingLvUpSuc.closeBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickSize = {
									width = 2272,
									height = 1280
								},
								offset = {
									x = 100,
									y = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "close_BuildingToast_view",
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
								return _ctx:gotoStory("guide_plot_7end")
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
								id = "BuildingView.button_back",
								arrowPos = 1,
								statisticPoint = "guide_main_building_16",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_205_6",
									dir = 1
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_building_main_view",
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
								id = "BuildingView.button_back",
								arrowPos = 1,
								statisticPoint = "guide_main_building_17",
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
								type = "enter_home_view_init",
								mask = {
									touchMask = true,
									opacity = 0
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
					return _ctx:checkComplexityNum(9)
				end,
				subnode = sequential({
					branch({
						{
							cond = function (_ctx)
								return _ctx:checkPointIsNotPass("S02S01")
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
											statisticPoint = "guide_main_stage_2_1_1",
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
											statisticPoint = "guide_main_stage_2_1_2",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 400,
												height = 400
											},
											offset = {
												x = -220,
												y = 80
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
								branch({
									{
										cond = function (_ctx)
											return _ctx:isPlayNewUnlockChapter()
										end,
										subnode = sequential({
											wait({
												args = function (_ctx)
													return {
														type = "exit_playNewUnlockChapter_view"
													}
												end
											})
										})
									}
								}),
								click({
									args = function (_ctx)
										return {
											id = "commonStageChapterDetail.btn_1",
											statisticPoint = "guide_main_stage_2_1_3",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 320,
												height = 340
											},
											offset = {
												x = 0,
												y = 35
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "story_play_end"
										}
									end
								})
							})
						}
					}),
					branch({
						{
							cond = function (_ctx)
								return _ctx:checkPointIsNotPass("M02S01")
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
															width = 400,
															height = 400
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
								click({
									args = function (_ctx)
										return {
											id = "commonStageChapterDetail.btn_1",
											statisticPoint = "guide_main_stage_2_1_5",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 320,
												height = 340
											},
											offset = {
												x = 0,
												y = 35
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
											id = "stagePointDetail.challengeBtn",
											statisticPoint = "guide_main_stage_2_1_6",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 320,
												height = 340
											},
											offset = {
												x = 0,
												y = 35
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "exit_minigame_win_view"
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
								click({
									args = function (_ctx)
										return {
											id = "commonStageChapterDetail.btnBack",
											arrowPos = 1,
											statisticPoint = "guide_main_stage_2_1_8",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 380,
												height = 200
											},
											offset = {
												x = 0,
												y = 20
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "enter_commonStageMain_view"
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "commonStageMain.btnBack",
											arrowPos = 1,
											statisticPoint = "guide_main_stage_2_1_9",
											mask = {
												touchMask = true,
												opacity = 0
											},
											clickSize = {
												width = 380,
												height = 200
											},
											offset = {
												x = 0,
												y = 20
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
								return _ctx:checkGuideSta("Mail") and not _ctx:isSaved("NewGuide_Mail")
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
								click({
									args = function (_ctx)
										return {
											id = "home.mail",
											statisticPoint = "guide_main_active_6",
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
											type = "enter_mail_view",
											mask = {
												touchMask = true
											}
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "mailView.mailCell",
											statisticPoint = "guide_main_active_7",
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
								click({
									args = function (_ctx)
										return {
											id = "mailView.receiveBtn",
											statisticPoint = "guide_main_active_8",
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
											type = "exit_GetRewardView_suc"
										}
									end
								}),
								storyRecordSave({
									args = function (_ctx)
										return {
											name = "NewGuide_Mail"
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "mailView.btnback",
											statisticPoint = "guide_main_active_9",
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
								guideShow({
									args = function (_ctx)
										return {
											statisticPoint = "guide_main_active_10",
											mask = {
												touchMask = true,
												opacity = 0
											},
											textArgs = {
												text = "NewPlayerGuide_108_6",
												dir = 0
											}
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "home.recruitEquip_btn",
											statisticPoint = "guide_main_active_11",
											mask = {
												touchMask = true,
												opacity = 0
											},
											textArgs = {
												text = "NewPlayerGuide_103_6",
												dir = 0
											},
											offset = {
												x = -20,
												y = 20
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "enter_recruitMain_view",
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
											id = "recruitMain.recruitBtn3",
											maskRes = "asset/story/zhandou_mask08.png",
											statisticPoint = "guide_main_active_12",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "NewPlayerGuide_108_7",
												dir = 0
											},
											maskSize = {
												w = 234,
												h = 94
											},
											offset = {
												x = 0,
												y = 0
											}
										}
									end
								})
							})
						}
					})
				})
			},
			{
				subnode = sequential({
					branch({
						{
							cond = function (_ctx)
								return _ctx:checkGuideSta("Mail") and not _ctx:isSaved("NewGuide_Mail")
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
								click({
									args = function (_ctx)
										return {
											id = "home.mail",
											statisticPoint = "guide_main_active_6",
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
											type = "enter_mail_view",
											mask = {
												touchMask = true
											}
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "mailView.mailCell",
											statisticPoint = "guide_main_active_7",
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
								click({
									args = function (_ctx)
										return {
											id = "mailView.receiveBtn",
											statisticPoint = "guide_main_active_8",
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
											type = "exit_GetRewardView_suc"
										}
									end
								}),
								storyRecordSave({
									args = function (_ctx)
										return {
											name = "NewGuide_Mail"
										}
									end
								}),
								click({
									args = function (_ctx)
										return {
											id = "mailView.btnback",
											statisticPoint = "guide_main_active_9",
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
								click({
									args = function (_ctx)
										return {
											id = "home.recruitEquip_btn",
											statisticPoint = "guide_main_active_11",
											mask = {
												touchMask = true,
												opacity = 0
											},
											textArgs = {
												text = "NewPlayerGuide_103_6",
												dir = 0
											},
											offset = {
												x = -20,
												y = 20
											}
										}
									end
								}),
								wait({
									args = function (_ctx)
										return {
											type = "enter_recruitMain_view",
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
											id = "recruitMain.recruitBtn3",
											maskRes = "asset/story/zhandou_mask08.png",
											statisticPoint = "guide_main_active_12",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "NewPlayerGuide_108_7",
												dir = 0
											},
											maskSize = {
												w = 234,
												h = 94
											},
											offset = {
												x = 0,
												y = 0
											}
										}
									end
								})
							})
						}
					})
				})
			}
		})
	})
end

local function guide_chapterOne1_4(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_chapterOne1_4_action",
					scene = scene_guideChapterOne1_4
				}
			end
		})
	})
end

stories.guide_chapterOne1_4 = guide_chapterOne1_4

return _M
