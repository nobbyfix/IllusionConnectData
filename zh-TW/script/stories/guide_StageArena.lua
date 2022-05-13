local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_StageArena")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_stageArena = {
	actions = {}
}
scenes.scene_stageArena = scene_stageArena

function scene_stageArena:stage(args)
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

function scene_stageArena.actions.action_stage_arena(_root, args)
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
					return _ctx:showNewSystemUnlock("StageArena")
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
					id = "home.arena_btn",
					statisticPoint = "guide_StageArena_1",
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "StageArena_Newbie01",
						dir = 0
					},
					offset = {
						x = 10,
						y = -17
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_FunctionEntrance_StageArena_view",
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
					return _ctx:checkStageArenaOpen()
				end,
				subnode = sequential({
					click({
						args = function (_ctx)
							return {
								id = "functionEntrance.node_6",
								statisticPoint = "guide_StageArena_2",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "StageArena_Newbie02",
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
								type = "enter_LeadStageArenaMain_view",
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
								id = "LeadStageArenaMainMediator.info_power",
								maskRes = "asset/story/zhandou_mask08.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "StageArena_Newbie03",
									dir = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "LeadStageArenaMainMediator.info_coin",
								maskRes = "asset/story/zhandou_mask08.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "StageArena_Newbie04",
									dir = 0
								}
							}
						end
					}),
					branch({
						{
							cond = function (_ctx)
								return _ctx:checkStageArenaState()
							end,
							subnode = sequential({
								click({
									args = function (_ctx)
										return {
											id = "LeadStageArenaMainMediator.enter",
											statisticPoint = "guide_StageArena_3",
											mask = {
												touchMask = true,
												opacity = 0
											},
											textArgs = {
												text = "StageArena_Newbie05",
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
											type = "enter_LeadStageArenaRival_view",
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
											id = "LeadStageArenaRivalMediator.guide_team",
											maskRes = "asset/story/zhandou_mask08.png",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "StageArena_Newbie06",
												dir = 1
											}
										}
									end
								}),
								guideShow({
									args = function (_ctx)
										return {
											id = "LeadStageArenaRivalMediator.guide_team",
											maskRes = "asset/story/zhandou_mask08.png",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "StageArena_Newbie07",
												dir = 1
											}
										}
									end
								}),
								guideShow({
									args = function (_ctx)
										return {
											id = "LeadStageArenaRivalMediator.guide_coin",
											maskRes = "asset/story/zhandou_mask08.png",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "StageArena_Newbie08",
												dir = 0
											}
										}
									end
								}),
								guideShow({
									args = function (_ctx)
										return {
											id = "LeadStageArenaRivalMediator.guide_refresh",
											maskRes = "asset/story/zhandou_mask08.png",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "StageArena_Newbie10",
												dir = 0
											}
										}
									end
								}),
								guideShow({
									args = function (_ctx)
										return {
											id = "LeadStageArenaRivalMediator.guide_info",
											maskRes = "asset/story/zhandou_mask08.png",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "StageArena_Newbie11",
												dir = 4
											}
										}
									end
								})
							})
						},
						{
							subnode = sequential({
								guideShow({
									args = function (_ctx)
										return {
											id = "LeadStageArenaMainMediator.enter1",
											maskRes = "asset/story/zhandou_mask08.png",
											mask = {
												touchMask = true,
												opacity = 0.4
											},
											textArgs = {
												text = "StageArena_Newbie13",
												dir = 0
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
					guideShow({
						args = function (_ctx)
							return {
								id = "functionEntrance.node_6",
								maskRes = "asset/story/zhandou_mask08.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "StageArena_Newbie12",
									dir = 0
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_StageArena(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_stage_arena",
					scene = scene_stageArena
				}
			end
		})
	})
end

stories.guide_StageArena = guide_StageArena

return _M
